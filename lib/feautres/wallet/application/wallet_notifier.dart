import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_moneyblaster/core/constants.dart';
import 'package:ff_moneyblaster/core/utils/toast.dart';
import 'package:ff_moneyblaster/feautres/auth/domain/user_model.dart';
import 'package:ff_moneyblaster/feautres/wallet/application/user_wallet_state.dart';
import 'package:ff_moneyblaster/feautres/wallet/domain/i_wallet_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod/riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

enum WalletTab {
  withdraw,
  deposit,
}

class WalletNotifier extends StateNotifier<UserWalletState> {
  final IWalletRepository _walletRepository;
  WalletNotifier(this._walletRepository) : super(const UserWalletState()) {
    fetchUserDetails();
  }

  List<TransactionHistory> withdrawalTransactions = [];
  List<TransactionHistory> depositTransactions = [];
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  ScrollController scrollController = ScrollController();

  @override
  void dispose() async {
    super.dispose();
    scrollController.dispose();
    refreshController.dispose();
  }

  void onRefresh() async {
    // monitor network fetch
    // Store current scroll position
    double scrollPosition = scrollController.position.pixels;
    if (mounted) await fetchUserDetails();
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
    // scrollController.jumpTo(_scrollPosition);
  }

  double generateRandomNumber() {
    // Create a random number generator
    Random random = Random();

    // Generate a random number between 0 and 1
    double randomNumber = random.nextDouble();

    // Scale and shift the number to the desired range [0.25, 0.50]
    double scaledNumber = 0.01 + (0.15 - 0.01) * randomNumber;

    // Convert the number to a string with 2 decimal places and then back to a double
    double formattedNumber = double.parse(scaledNumber.toStringAsFixed(2));

    return formattedNumber;
  }

  Future<void> launchInWebView(Uri url) async {
    if (await launchUrl(url, mode: LaunchMode.platformDefault)) {
      await Future.delayed(const Duration(seconds: 2));
      final id = FirebaseAuth.instance.currentUser?.uid;
      final ref = FirebaseFirestore.instance.collection('appusers').doc(id);
      try {
        final doc = await ref.get();
        if (doc.exists) {
          final user = UserModel.fromJson(doc.data()!);
          final randomNumber = generateRandomNumber();
          final balance = doc.data()!["wallet"]["balance"] + randomNumber;
          final adSum = doc.data()!["wallet"]["adRevenue"] + randomNumber;
          await ref.update({
            'wallet.balance': balance,
            'wallet.adRevenue': adSum,
          }).then((value) {
            state = state.copyWith(
                adClicked: state.adClicked + 1, lastAdReward: randomNumber);
          });

          showToastMessage('You Won ₹$randomNumber !');
          await fetchUserDetails();
        }
      } catch (e) {
        rethrow;
      }
    } else {
      throw Exception('Could not launch $url');
    }
  }

  void onLoading() async {
    // monitor network fetch
    double scrollPosition = scrollController.position.pixels;

    // if failed,use loadFailed(),if no data return,use LoadNodata()

    refreshController.loadComplete();
    // scrollController.jumpTo(_scrollPosition);
  }

  Future<void> getQr() async {
    final qrs = await _walletRepository.getQrs();
    state = state.copyWith(
        qr: qrs.singleWhere((element) => element.isDefault == true));
  }

  void selectTab(WalletTab tab) {
    state = state.copyWith(selectedWalletTab: tab);
  }

  Future<void> requestWithdraw(
    BuildContext context, {
    required String name,
    required String accountNo,
    required String ifscCode,
    required double amount,
  }) async {
    try {
      state = state.copyWith(isLoading: true);
      Map<String, dynamic> newTransaction = {
        'datetime': Timestamp.now(),
        'transaction': amount,
        'transactionStatus': 'requested',
        'transactionType': 'withdraw',
        'fullName': name,
        'accountNo': accountNo,
        'ifscCode': ifscCode,
      };

      final String uid = _firebaseAuth.currentUser?.uid ?? '';

      try {
        DocumentReference userRef = _firestore.collection('appusers').doc(uid);
        var snapshot = await userRef.get();
        Map<String, dynamic> userData = snapshot.data() as Map<String, dynamic>;
        // print("snapshot: ${userData["wallet"]["balance"]}");

        if (userData["wallet"]["balance"] < amount) {
          Fluttertoast.showToast(
              msg: 'Chosen amount is more than the balance available.');
          return;
        }

        await userRef.update({
          'wallet.balance': userData["wallet"]["balance"] - amount,
        });

        // await fetchUserDetails();
      } catch (error) {
        // print('Error adding transaction: $error');
      }

      bool result =
          await _walletRepository.addTransactionToWallet(newTransaction);
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        if (result) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Withdraw requested. It will reflect in your bank account, once we verify.',
              ),
              duration: Duration(seconds: 3),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Something went wrong, please try again.',
              ),
              duration: Duration(seconds: 3),
            ),
          );
        }
      }
    } catch (e) {}
  }

  Future<bool> isTransactionIdUnique(String transactionId) async {
    List<UserModel> users;
    bool isUnique = true;
    try {
      final userDocs = await _firestore.collection('appusers').get();
      users =
          userDocs.docs.map((user) => UserModel.fromJson(user.data())).toList();
      for (UserModel user in users) {
        isUnique = user.wallet.history.every(
            (element) => element.transactionId.trim() != transactionId.trim());
        if (!isUnique) {
          break;
        }
      }

      return isUnique;
    } catch (e) {
      debugPrint(e.toString());
    }

    UserModel? user = state.user;
    return user?.wallet.history.every((transaction) =>
            transaction.transactionId.trim() != transactionId.trim()) ??
        false;
  }

  Future<bool> hasPendingDeposits() async {
    UserModel user = state.user!;
    return user.wallet.history.any((transaction) =>
        transaction.transactionType == 'deposit' &&
        transaction.transactionStatus == 'requested');
  }

  Future<void> requestDeposit(
    BuildContext context, {
    required String transactionId,
    required double amount,
  }) async {
    state = state.copyWith(isLoading: true);
    bool transactionIdUnique = await isTransactionIdUnique(transactionId);
    if (!transactionIdUnique) {
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                'Transaction ID is not unique, please try a different ID.'),
            duration: Duration(seconds: 3),
          ),
        );
        return;
      }
    }

    bool pendingDeposits = await hasPendingDeposits();
    if (pendingDeposits) {
      state = state.copyWith(isLoading: false);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('You already have a pending deposit.'),
            duration: Duration(seconds: 3),
          ),
        );
        return;
      }
    }

    Map<String, dynamic> newTransaction = {
      'datetime': Timestamp.now(),
      'transaction': amount,
      'transactionStatus': 'requested',
      'transactionType': 'deposit',
      'transactionId': transactionId,
    };
    bool result =
        await _walletRepository.addTransactionToWallet(newTransaction);
    state = state.copyWith(isLoading: false);
    if (context.mounted) {
      if (result) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Deposit requested. It will reflect in your wallet, once we verify.',
            ),
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Something went wrong, please try again.',
            ),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Future<void> fetchUserDetails() async {
    // if (!mounted) {
    //   return;
    // }
    state = state.copyWith(isLoading: true);
    try {
      UserModel user = await _walletRepository.getUserModel();
      state = state.copyWith(user: user, isLoading: false);
      withdrawalTransactions = state.user!.wallet.history
          .where((history) =>
              history.transaction > 0 && history.transactionType == 'withdraw')
          .toList();
      depositTransactions = state.user!.wallet.history
          .where((history) =>
              history.transaction > 0 && history.transactionType == 'deposit')
          .toList();
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  String getTransactionStatusText(String status) {
    switch (status) {
      case 'success':
        return '';
      case 'rejected':
        return 'rejected';
      default:
        return 'requested';
    }
  }

  Color getTransactionTextColor(String type) {
    switch (type) {
      case 'deposit':
        return AppColors.blue;
      case 'withdraw':
        return AppColors.red;
      case 'entryfee':
        return AppColors.red;
      case 'winning':
        return AppColors.blue;
      default:
        return AppColors.blue;
    }
  }

  String getTransactionTypeText(String type) {
    switch (type) {
      case 'deposit':
        return 'Deposit';
      case 'withdraw':
        return 'Withdrawal';
      case 'winning':
        return 'Winning';
      case 'referral':
        return 'Referral commission';
      default:
        return 'Entry fee deduction';
    }
  }

  int calculateTotalTransactionsInLast24Hours() {
    WalletModel? wallet = state.user?.wallet;
    DateTime now = DateTime.now();

    var recentTransactions = wallet?.history.where((transaction) {
      return transaction.datetime!
              .isAfter(now.subtract(const Duration(hours: 24))) &&
          transaction.transactionStatus == "success";
    });

    int totalAmount = recentTransactions?.fold(
          0,
          (sumup, current) => sumup ?? 0 + current.transaction,
        ) ??
        0;

    return totalAmount;
  }

  Future<void> getReferredList() async {
    state = state.copyWith(isLoading: true);
    final list = await _walletRepository.getReferredUserList();
    state = state.copyWith(isLoading: false, referredList: list);
  }
}

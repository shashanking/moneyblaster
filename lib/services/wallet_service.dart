import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_moneyblaster/feautres/auth/domain/user_model.dart';
import 'package:ff_moneyblaster/feautres/wallet/domain/i_wallet_repository.dart';
import 'package:ff_moneyblaster/feautres/wallet/domain/qr_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WalletRepository implements IWalletRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<bool> addTransactionToWallet(Map<String, dynamic> transaction) async {
    final String uid = _firebaseAuth.currentUser?.uid ?? '';

    if (uid.isEmpty) {
      // print('No user logged in!');
      return false;
    }

    try {
      DocumentReference userRef = _firestore.collection('appusers').doc(uid);
      var snapshot = await userRef.get();

      if (!snapshot.exists) {
        // print('User document does not exist!');
        // Optionally create the document or handle the lack of it appropriately
        return false;
      }

      await userRef.update({
        'wallet.history': FieldValue.arrayUnion([transaction])
      });
      return true;
    } catch (error) {
      // print('Error adding transaction: $error');
      return false;
    }
  }

  @override
  Future<List<UserModel>> getReferredUserList() async {
    final id = _firebaseAuth.currentUser?.uid;
    var collection = FirebaseFirestore.instance.collection('appusers');
    var snapshot = await collection.get();

    final users =
        snapshot.docs.map((doc) => UserModel.fromJson(doc.data())).toList();
    final filteredUser =
        users.where((element) => element.referredBy == id).toList();
    return filteredUser;
  }

  @override
  Future<UserModel> getUserModel() async {
    try {
      var userDoc = await _firestore
          .collection('appusers')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();
      if (!userDoc.exists) {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'No user found with that ID.',
        );
      }
      var userData = userDoc.data();
      return UserModel(
        id: _firebaseAuth.currentUser!.uid,
        username: userData?['username'],
        gameId: userData?['gameId'],
        phoneNumber: userData?['phoneNumber'],
        referralCode: userData?['referralCode'],
        isVerified: userData?['isVerified'] ?? false,
        gameStats: GameStats(
          game: userData?['gameStats']['game'],
          totalGames: userData?['gameStats']['totalGames'] ?? 0,
          totalKills: userData?['gameStats']['totalKills'] ?? 0,
          totalWins: userData?['gameStats']['totalWins'] ?? 0,
        ),
        wallet: WalletModel(
          balance: userData?['wallet']['balance'] ?? 0,
          history: (userData?['wallet']['history'] as List<dynamic>? ?? [])
              .map(
                  (h) => TransactionHistory.fromJson(h as Map<String, dynamic>))
              .toList(),
          stats: (userData?['wallet']['stats'] as List<dynamic>? ?? [])
              .map((h) => BalanceStat.fromJson(h as Map<String, dynamic>))
              .toList(),
        ),
      );
    } catch (e) {
      throw FirebaseAuthException(
        code: 'user-fetch-error',
        message: 'Error occurred while fetching user data.',
      );
    }
  }

  @override
  Future<List<QrModel>> getQrs() async {
    var collection = FirebaseFirestore.instance.collection('qrs');
    var snapshot = await collection.get();

    var some =
        snapshot.docs.map((doc) => QrModel.fromJson(doc.data())).toList();
    return some;
  }
}

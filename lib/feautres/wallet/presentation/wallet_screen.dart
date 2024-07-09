import 'dart:math';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ff_moneyblaster/core/assets.dart';
import 'package:ff_moneyblaster/core/constants.dart';
import 'package:ff_moneyblaster/core/utils/toast.dart';
import 'package:ff_moneyblaster/feautres/auth/domain/user_model.dart';
import 'package:ff_moneyblaster/feautres/wallet/application/wallet_notifier.dart';
import 'package:ff_moneyblaster/feautres/wallet/presentation/widgets/deposit_bottom_sheets.dart';
import 'package:ff_moneyblaster/feautres/wallet/presentation/widgets/tabbar.dart';
import 'package:ff_moneyblaster/feautres/wallet/presentation/widgets/withdraw_bottom_sheet.dart';
import 'package:ff_moneyblaster/feautres/wallet/shared/provider.dart';
import 'package:ff_moneyblaster/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

@RoutePage(name: 'WalletScreen')
class WalletScreen extends ConsumerStatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<WalletScreen> {
  int adClicked = 0;
  final int maxTapsPerDay = 15;
  late List<Widget> balanceStatList = [];
  @override
  void dispose() {
    // final provider = ref.read(walletProvider.notifier);
    // provider.dispose();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final notifier = ref.read(walletProvider.notifier);
      await notifier.fetchUserDetails();
      _loadAdClickData();
      //set carousal of balance stats
    });
    super.initState();
  }

  Future<void> _loadAdClickData() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().split('T').first;
    final savedDate = prefs.getString('adClickDate') ?? today;
    if (savedDate == today) {
      adClicked = prefs.getInt('adClickCount') ?? 0;
    } else {
      prefs.setString('adClickDate', today);
      prefs.setInt('adClickCount', 0);
    }
  }

  Future<void> _incrementAdClick() async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().split('T').first;
    adClicked += 1;
    prefs.setString('adClickDate', today);
    prefs.setInt('adClickCount', adClicked);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        ref.watch(walletProvider.select((state) => state.isLoading));
    final state = ref.watch(walletProvider);
    final provider = ref.watch(walletProvider.notifier);

    if (state.user?.wallet != null) {
      balanceStatList = state.user!.wallet.stats
          .map((e) => Row(
                children: [
                  Text(
                    'You got ₹ ${e.transactionAmount} in ${e.tournamentName.toUpperCase()} tournament',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ))
          .toList()
          .reversed
          .toList();
    }

    // Calculate remaining available height after subtracting bottom view inset
    final screenHeight = MediaQuery.of(context).size.height;
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final remainingHeight = screenHeight - bottomInset;

    final lastDepositTransactionStatus =
        provider.depositTransactions.reversed.length != 0
            ? provider.depositTransactions.reversed.first.transactionStatus
            : '';
    final lastWithdrawalTransactionStatus =
        provider.withdrawalTransactions.reversed.length != 0
            ? provider.withdrawalTransactions.reversed.first.transactionStatus
            : "";

    return isLoading
        ? Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 1,
            decoration: BoxDecoration(
              color: AppColors.blackBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/bg.png',
                ).image,
              ),
            ),
            child: const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            )),
          )
        : Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 1,
            decoration: BoxDecoration(
              color: AppColors.blackBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/bg.png',
                ).image,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height * 0.36,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                Color.fromRGBO(206, 59, 59, 1),
                                Color.fromRGBO(95, 18, 55, 1),
                              ])),
                          child: Image.asset(
                            Assets.walletBannerBG,
                            scale: 2,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 50,
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // wallet title
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'WALLET',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  // if (state.user!.wallet.balance < 20.00)
                                  //   GestureDetector(
                                  //     onTap: () async {
                                  //       if (!state.isLoading) {
                                  //         if (adClicked <
                                  //             (maxTapsPerDay +
                                  //                 Random().nextInt(6))) {
                                  //           // sfsfs
                                  //           await provider.launchInWebView(
                                  //               Uri.parse(AppConstants.adUrl));
                                  //           await _incrementAdClick();
                                  //           showToastMessage(
                                  //               'You Won Ad Reward ${state.lastAdReward ?? 0} !');
                                  //         } else {
                                  //           showToastMessage(
                                  //               'Ad Limit Reached !');
                                  //           // showToastMessage(
                                  //           //     'try after some time !');
                                  //         }
                                  //       }
                                  //     },
                                  //     child: Column(
                                  //       children: [
                                  //         Container(
                                  //           decoration: customDecoration,
                                  //           padding: const EdgeInsets.symmetric(
                                  //               vertical: 4, horizontal: 8),
                                  //           child: const Row(
                                  //             mainAxisSize: MainAxisSize.min,
                                  //             children: [
                                  //               Icon(
                                  //                 Icons.video_collection,
                                  //                 color: Colors.white,
                                  //               ),
                                  //               SizedBox(
                                  //                 width: 6,
                                  //               ),
                                  //               Text('Watch & Earn')
                                  //             ],
                                  //           ),
                                  //         ),
                                  //         SizedBox(
                                  //           height: 4,
                                  //         ),
                                  //         Row(
                                  //           mainAxisSize: MainAxisSize.min,
                                  //           children: [
                                  //             Text(
                                  //               '${state.lastAdReward ?? 0} LAST AD REWARD',
                                  //               style: Theme.of(context)
                                  //                   .textTheme
                                  //                   .labelSmall,
                                  //             )
                                  //           ],
                                  //         )
                                  //       ],
                                  //     ),
                                  //   )
                                ],
                              ),
                              // 2 current wallet balance row
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Current Wallet Balance',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              // 3 ballance
                              Row(
                                children: [
                                  Text(
                                    '₹ ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 32,
                                            fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    state.user?.wallet.balance
                                            .toStringAsFixed(2) ??
                                        "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 32,
                                            fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              // 4 past 24 hour money
                              Container(
                                height: 30,
                                width: 90.w,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                                child: CarouselSlider(
                                  items: balanceStatList,
                                  options: CarouselOptions(
                                    autoPlay: balanceStatList.length > 1
                                        ? true
                                        : false,
                                    // aspectRatio: 1,
                                    viewportFraction: 1,

                                    initialPage: 0,
                                    pauseAutoPlayOnTouch: true,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              // note
                              Row(
                                children: [
                                  Text(
                                    'Minimum deposit amount : ₹20',
                                    style:
                                        Theme.of(context).textTheme.labelSmall,
                                  )
                                ],
                              ),
                              // buttons deposit and withdrawl

                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 16.0, bottom: 24),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        // await notifier.selectTournament(
                                        //     widget.tournament);
                                        lastDepositTransactionStatus ==
                                                "requested"
                                            ? Fluttertoast.showToast(
                                                msg:
                                                    "Cannot make multiple deposit requests")
                                            : showModalBottomSheet<void>(
                                                enableDrag: true,
                                                // isDismissible: false,
                                                backgroundColor:
                                                    AppColors.glassColor,
                                                barrierColor:
                                                    const Color.fromRGBO(
                                                        7, 7, 7, 0.7),
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return const FractionallySizedBox(
                                                    heightFactor: 1.7,
                                                    child: DepositBottomSheet(),
                                                  );
                                                  // return const DepositBottomSheet();
                                                },
                                              );
                                      },
                                      child: const CustomButton(
                                        text: 'Deposit',
                                        icon: Icons.upload,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        // await notifier.selectTournament(
                                        //     widget.tournament);
                                        lastWithdrawalTransactionStatus ==
                                                "requested"
                                            ? Fluttertoast.showToast(
                                                msg:
                                                    "Cannot make multiple withdrawal requests")
                                            : showModalBottomSheet<void>(
                                                // isDismissible: false,
                                                // isScrollControlled: true,
                                                // constraints: ,
                                                backgroundColor:
                                                    AppColors.glassColor,
                                                barrierColor:
                                                    const Color.fromRGBO(
                                                        7, 7, 7, 0.7),
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return BackdropFilter(
                                                    filter: ImageFilter.blur(
                                                        sigmaX: 2, sigmaY: 2),
                                                    child:
                                                        const WithdrawBottomSheet(),
                                                  );
                                                  // return BackdropFilter(
                                                  //   filter: ImageFilter.blur(
                                                  //       sigmaX: 2, sigmaY: 2),
                                                  //   child:
                                                  //       const WithdrawBottomSheet(),
                                                  // );
                                                },
                                              );
                                      },
                                      child: const CustomButton(
                                        filled: true,
                                        text: 'Withdraw',
                                        icon: Icons.download,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                // tab bar
                SizedBox(
                  height: 63.3.h,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TabBarWallet(),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          padding: const EdgeInsets.all(16),
                          child: state.isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : state.errorMessage.isNotEmpty
                                  ? Text("Error: ${state.errorMessage}")
                                  : MediaQuery.removePadding(
                                      context: context,
                                      removeTop: true,
                                      child: state.selectedWalletTab ==
                                              WalletTab.withdraw
                                          ? _buildTransactionListview(
                                              provider.withdrawalTransactions,
                                              provider)
                                          : _buildTransactionListview(
                                              provider.depositTransactions,
                                              provider)))
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  ListView _buildTransactionListview(
      List<TransactionHistory> transactions, WalletNotifier provider) {
    return ListView.separated(
      itemCount: transactions.length,
      itemBuilder: (context, index) {
        TransactionHistory transaction = transactions[index];

        bool isToday = DateTime.now().year == transaction.datetime?.year &&
            DateTime.now().month == transaction.datetime?.month &&
            DateTime.now().day == transaction.datetime?.day;

        String formattedTime;

        if (isToday) {
          formattedTime = DateFormat('h:mm a').format(transaction.datetime!);
        } else {
          formattedTime =
              DateFormat('dd/MM/yy h:mm a').format(transaction.datetime!);
        }
        return Container (
          height: 45,
          width: double.infinity,
          decoration:
              customDecoration.copyWith(borderRadius: BorderRadius.circular(8)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text:
                                '${provider.getTransactionTypeText(transaction.transactionType)} of ',
                            style: Theme.of(context).textTheme.bodyMedium),
                        TextSpan(
                          text: ' ₹ ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: provider.getTransactionTextColor(
                                      transaction.transactionType),
                                  fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: transaction.transaction.abs().toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: provider.getTransactionTextColor(
                                      transaction.transactionType),
                                  fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                            text:
                                ' ${provider.getTransactionStatusText(transaction.transactionStatus)}',
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  ),
                ),
                Text(
                  formattedTime,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 10),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 12,
        );
      },
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.filled = false,
    required this.text,
    required this.icon,
    super.key,
  });
  final bool filled;
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color: filled ? AppColors.greyText : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.greyText, width: 1),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: filled ? AppColors.red : AppColors.greyText,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: filled ? AppColors.red : AppColors.greyText,
                  ),
            )
          ],
        ),
      ),
    );
  }
}

class Filter extends StatelessWidget {
  const Filter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Filters',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                Assets.filter,
                scale: 2,
              ))
        ],
      ),
    );
  }
}

/**
 *  SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppConstants.wallet.toUpperCase(),
                      style: const TextStyle(
                        fontFamily: 'Apex',
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      'Current Wallet Balance',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w300
                          // letterSpacing: 0,
                          // fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      '₹10',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                            fontSize: 45,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          
 */

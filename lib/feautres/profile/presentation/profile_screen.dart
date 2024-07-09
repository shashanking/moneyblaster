import 'package:auto_route/auto_route.dart';
import 'package:clipboard/clipboard.dart';
import 'package:ff_moneyblaster/core/assets.dart';
import 'package:ff_moneyblaster/core/constants.dart';
import 'package:ff_moneyblaster/feautres/auth/shared/provider.dart';
import 'package:ff_moneyblaster/feautres/home/application/home_state.dart';
import 'package:ff_moneyblaster/feautres/home/shared/provider.dart';
import 'package:ff_moneyblaster/feautres/profile/presentation/profile_tab.dart';
import 'package:ff_moneyblaster/feautres/profile/presentation/promode_tab.dart';
import 'package:ff_moneyblaster/feautres/wallet/presentation/widgets/tabbar.dart';
import 'package:ff_moneyblaster/feautres/wallet/shared/provider.dart';
import 'package:ff_moneyblaster/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

@RoutePage(name: 'ProfileScreen')
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      _initial();
    });
    super.initState();
  }

  _initial() async {
    await ref.read(authProvider.notifier).fetchCurrentUserData();
    await ref.read(walletProvider.notifier).getReferredList();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authProvider);
    final tabState = ref.watch(homeProvider).selectedProfileTab;
    final provider = ref.read(authProvider.notifier);

    final isLoading = state.isLoading;

    return Container(
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
      child: isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.white))
          : Column(
              children: [
                SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height * 0.15,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color.fromRGBO(206, 59, 59, 1),
                              Color.fromRGBO(95, 18, 55, 1),
                            ]),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 16.0, right: 16, top: 48, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(
                                  tabState == ProfileTabState.profile
                                      ? 'PROFILE'
                                      : 'PROFESSIONAL MODE',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                const ProfileTaB(),
                const SizedBox(
                  height: 20,
                ),
                // tab bar
                if (tabState == ProfileTabState.profile) const ProfileTab(),
                if (tabState == ProfileTabState.promode) const ProModeTab(),
              ],
            ),
    );
  }
}

class PlayerDetailInfo extends StatelessWidget {
  const PlayerDetailInfo({
    super.key,
    required this.title,
    required this.value,
    this.withCopy = true,
    this.copyMsg = 'Value copied to clipboard',
  });

  final String title;
  final String value;
  final bool withCopy;
  final String? copyMsg;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 60,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration:
              customDecoration.copyWith(borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.greyLight),
                ),
                GestureDetector(
                  onTap: () {
                    FlutterClipboard.copy(value).then((value) =>
                        Fluttertoast.showToast(
                            msg: copyMsg ?? 'UPI ID Copied.'));
                  },
                  child: SizedBox(
                    height: 50,
                    width: 50,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Positioned.fill(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 6),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.copy,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
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

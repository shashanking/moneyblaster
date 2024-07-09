import 'package:auto_route/auto_route.dart';
import 'package:ff_moneyblaster/feautres/home/presentation/home_screen.dart';
import 'package:ff_moneyblaster/feautres/notification/presentation/notification_screen.dart';
import 'package:ff_moneyblaster/feautres/profile/presentation/profile_screen.dart';
import 'package:ff_moneyblaster/feautres/wallet/presentation/wallet_screen.dart';
import 'package:ff_moneyblaster/feautres/leaderboard/presentation/leaderboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../shared/providers.dart';
import 'bottom_navigation.dart';

@RoutePage()
class BasePage extends ConsumerStatefulWidget {
  const BasePage({super.key});

  @override
  ConsumerState<BasePage> createState() => BasePageState();
}

class BasePageState extends ConsumerState<BasePage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(baseNotifierProvider);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   systemOverlayStyle: state.bottomNavIndex == 2
      //       ? SystemUiOverlayStyle.dark
      //       : SystemUiOverlayStyle.light,
      //   backgroundColor: AppColors.colorTransparent,
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      // ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              extendBody: true,
              resizeToAvoidBottomInset: false,
              bottomNavigationBar: const BottomNavigation(),
              body: Stack(
                children: [
                  Offstage(
                    offstage: (state.bottomNavIndex !=
                        0), // true -> hidden, false -> visible
                    child: Container(
                      height: 100.h,
                      width: 100.w,
                      color: Colors.red,
                    ),
                  ),
                  widgetView(state.bottomNavIndex),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget widgetView(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const WalletScreen();
      case 2:
        return const LeaderbaordScreen();
      case 3:
        return const NotificationScreen();
      case 4:
        return const ProfileScreen();
      default:
        return Container();
    }
  }
}

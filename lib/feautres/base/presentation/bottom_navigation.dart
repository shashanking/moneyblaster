import 'package:ff_moneyblaster/core/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import '../shared/providers.dart';
import 'bottom_item.dart';

class BottomNavigation extends ConsumerWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(baseNotifierProvider);
    final stateNotifier = ref.watch(baseNotifierProvider.notifier);
    // final cartNotifier = ref.watch(cartProvivvvvder.notifier);

    final Size size = MediaQuery.of(context).size;
    const List<Map> bottomItems = [
      {'icon': Assets.home, 'active': Assets.homeSelected, 'name': 'Home'},
      {'icon': Assets.wallet, 'active': Assets.walletSelected, 'name': 'Wallet'},
      {
        'icon': Assets.leaderboard,
        'active': Assets.leaderboardSelected,
        'name': 'Leaderboard'
      },
      {
        'icon': Assets.notification,
        'active': Assets.notificationSelected,
        'name': 'Notification'
      },
      {
        'icon': Assets.profile,
        'active': Assets.profileSelected,
        'name': 'Profile'
      },
    ];

    return SizedBox(
      width: size.width,
      height: 9.h,
      child: Stack(
        children: [
          Container(
            color: Colors.black,
          ),
          SizedBox(
            width: size.width,
            height: 90,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    bottomItems.length,
                    (index) => GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          if (index == 1) {
                            // cartNotifier.listItems();
                            stateNotifier.tapBottomNavIndex(index);
                          } else {
                            stateNotifier.tapBottomNavIndex(index);
                          }
                        },
                        child: BottomItem(
                          icon: state.bottomNavIndex == index
                              ? bottomItems[index]['active']
                              : bottomItems[index]['icon'],
                          text: bottomItems[index]['name'],
                          active: state.bottomNavIndex == index,
                        )))),
          ),
        ],
      ),
    );
  }
}

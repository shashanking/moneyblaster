import 'package:ff_moneyblaster/feautres/home/application/home_state.dart';
import 'package:ff_moneyblaster/feautres/home/shared/provider.dart';
import 'package:ff_moneyblaster/feautres/wallet/application/wallet_notifier.dart';
import 'package:ff_moneyblaster/feautres/wallet/shared/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants.dart';
import 'gradient_border_container_text.dart';

class TabBarWallet extends ConsumerWidget {
  const TabBarWallet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(walletProvider);
    final provider = ref.read(walletProvider.notifier);

    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => provider.selectTab(WalletTab.deposit),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: GradientBorderContainerText(
                  width: double.infinity,
                  height: 48,
                  radius: 0.0,
                  child: 'Deposit',
                  colors: AppColors.tabBorder,
                  isActive: state.selectedWalletTab == WalletTab.deposit,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => provider.selectTab(WalletTab.withdraw),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: GradientBorderContainerText(
                  width: double.infinity,
                  height: 48,
                  radius: 0.0,
                  child: 'Withdrawal',
                  colors: AppColors.tabBorder,
                  isActive: state.selectedWalletTab == WalletTab.withdraw,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileTaB extends ConsumerWidget {
  const ProfileTaB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeProvider);

    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => ref
                  .read(homeProvider.notifier)
                  .selectProfileTab(ProfileTabState.profile),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: GradientBorderContainerText(
                  width: double.infinity,
                  height: 48,
                  radius: 0.0,
                  child: 'Profile',
                  colors: AppColors.tabBorder,
                  isActive:
                      homeState.selectedProfileTab == ProfileTabState.profile,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => ref
                  .read(homeProvider.notifier)
                  .selectProfileTab(ProfileTabState.promode),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: GradientBorderContainerText(
                  width: double.infinity,
                  height: 48,
                  radius: 0.0,
                  child: 'Pro Mode',
                  colors: AppColors.tabBorder,
                  isActive:
                      homeState.selectedProfileTab == ProfileTabState.promode,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

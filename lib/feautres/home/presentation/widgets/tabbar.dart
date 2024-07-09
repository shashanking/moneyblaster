import 'package:ff_moneyblaster/feautres/home/presentation/widgets/tournament_card.dart';
import 'package:ff_moneyblaster/feautres/home/shared/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants.dart';
import 'gradient_border_container_text.dart';

class TabBarHome extends ConsumerWidget {
  const TabBarHome({super.key});

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
              onTap: () => ref.read(homeProvider.notifier).selectTab(GameState.ongoing),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: GradientBorderContainerText(
                  width: double.infinity,
                  height: 48,
                  radius: 0.0,
                  child: 'Ongoing',
                  colors: AppColors.tabBorder,
                  isActive: homeState.selectedHomeTab == GameState.ongoing,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => ref.read(homeProvider.notifier).selectTab(GameState.upcoming),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: GradientBorderContainerText(
                  width: double.infinity,
                  height: 48,
                  radius: 0.0,
                  child: 'Upcoming',
                  colors: AppColors.tabBorder,
                  isActive: homeState.selectedHomeTab == GameState.upcoming,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => ref.read(homeProvider.notifier).selectTab(GameState.past),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: GradientBorderContainerText(
                  width: double.infinity,
                  height: 48,
                  radius: 0.0,
                  child: 'Past',
                  colors: AppColors.tabBorder,
                  isActive: homeState.selectedHomeTab == GameState.past,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

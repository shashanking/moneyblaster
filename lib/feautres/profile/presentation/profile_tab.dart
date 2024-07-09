import 'package:auto_route/auto_route.dart';
import 'package:ff_moneyblaster/core/assets.dart';
import 'package:ff_moneyblaster/core/constants.dart';
import 'package:ff_moneyblaster/feautres/profile/presentation/important_rules_page.dart';
import 'package:ff_moneyblaster/feautres/profile/presentation/profile_screen.dart';
import 'package:ff_moneyblaster/feautres/profile/presentation/terms_conditions_page.dart';
import 'package:ff_moneyblaster/routes/app_router.gr.dart';
import 'package:ff_moneyblaster/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:sizer/sizer.dart';

import '../../auth/shared/provider.dart';
import '../../home/shared/provider.dart';

class ProfileTab extends ConsumerStatefulWidget {
  const ProfileTab({super.key});

  @override
  ConsumerState<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends ConsumerState<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    final tabState = ref.watch(homeProvider).selectedProfileTab;
    final provider = ref.read(authProvider.notifier);
    return Container(
      height: 70.h,
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SingleChildScrollView(
        primary: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        border: GradientBoxBorder(
                          width: 5,
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(206, 59, 59, 1),
                            Color.fromRGBO(95, 18, 55, 1),
                          ]),
                        ),
                      ),
                      child: Image.asset(
                        Assets.profileImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          provider.user?.username ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Member since 24.04.24',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    )
                  ],
                ),
                // IconButton(
                //     onPressed: () {},
                //     icon: Image.asset(
                //       Assets.edit,
                //       scale: 2,
                //     ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // player stats
            Container(
              width: double.infinity,
              // height: 240,
              padding: const EdgeInsets.all(16),
              decoration: customDecoration.copyWith(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 1 total winning
                  Text(
                    'TOTAL EARNINGS',
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  // 2 money
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '₹ ${provider.user?.gameStats.totalEarned}',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                            color: AppColors.blue),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // 3 matches played
                  // Row(
                  //   mainAxisSize: MainAxisSize.max,
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       'Leaderboard Score',
                  //       style: Theme.of(context).textTheme.bodyMedium,
                  //     ),
                  //     Text(
                  //       provider.user?.gameStats.totalWinAmount.toString() ??
                  //           '',
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .bodyMedium
                  //           ?.copyWith(fontWeight: FontWeight.w700),
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),

                  // kills
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Kills',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        provider.user?.gameStats.totalKills.toString() ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Matches Played',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        provider.user?.gameStats.totalGames.toString() ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  // 4 matches won
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Matches Won',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        provider.user?.gameStats.totalWins.toString() ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // info
            const SizedBox(
              height: 20,
            ),
            PlayerDetailInfo(
              title: 'Game ID',
              value: provider.user?.gameId.toString() ?? '',
            ),
            PlayerDetailInfo(
              title: 'Phone Number',
              value: provider.user?.phoneNumber.toString() ?? '',
            ),
            const PlayerDetailInfo(
              title: 'MoneyBlaster Support',
              value: 'officialmoneyblaster@gmail.com',
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
                width: double.infinity,
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TermsConditionsPage()));
                    },
                    child: const CustomButton(
                      text: "Terms & Conditions",
                      icon: Icons.assignment,
                    ))),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
                width: double.infinity,
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ImportantRulesPage()));
                    },
                    child: const CustomButton(
                        text: "Important Rules", icon: Icons.gavel))),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () async {
                final notfier = ref.read(authProvider.notifier);
                await notfier.logout().then((value) =>
                    context.router.replaceAll([const SplashScreen()]));
              },
              child: const CustomButton(
                text: 'Logout',
                icon: Icons.logout,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}

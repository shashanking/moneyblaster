import 'package:ff_moneyblaster/core/assets.dart';
import 'package:ff_moneyblaster/feautres/auth/domain/user_model.dart';
import 'package:ff_moneyblaster/feautres/profile/presentation/profile_screen.dart';
import 'package:ff_moneyblaster/feautres/wallet/shared/provider.dart';
import 'package:ff_moneyblaster/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../auth/shared/provider.dart';
import '../../home/shared/provider.dart';

class ProModeTab extends ConsumerStatefulWidget {
  const ProModeTab({super.key});

  @override
  ConsumerState<ProModeTab> createState() => _ProModeTabState();
}

class _ProModeTabState extends ConsumerState<ProModeTab> {
  @override
  Widget build(BuildContext context) {
    final tabState = ref.watch(homeProvider).selectedProfileTab;
    final provider = ref.read(authProvider.notifier);
    final referralState = ref.watch(walletProvider).referredList;
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Container(
                    //   height: 90,
                    //   width: 90,
                    //   decoration: const BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     border: GradientBoxBorder(
                    //       width: 5,
                    //       gradient: LinearGradient(colors: [
                    //         Color.fromRGBO(206, 59, 59, 1),
                    //         Color.fromRGBO(95, 18, 55, 1),
                    //       ]),
                    //     ),
                    //   ),
                    //   child: Image.asset(
                    //     Assets.profileImg,
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    // const SizedBox(
                    //   width: 12,
                    // ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Refer & Earn',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: 50.w,
                          child: Text(
                            'Share your referral code with other players & get instant cashback.',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Image.asset(
                  Assets.coinIcon,
                  scale: 3,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            // player stats

            // info
            const SizedBox(
              height: 20,
            ),
            PlayerDetailInfo(
              title: 'Referral Code',
              value: provider.user?.referralCode.toString() ?? '',
              copyMsg: "Referral code copied to clipboard.",
            ),
            Text(
              'Your Referrals',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
            ),

            SizedBox(
              height: 40.h,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.separated(
                  itemCount: referralState.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 6,
                  ),
                  itemBuilder: (context, index) {
                    return ReferralListItem(
                      model: referralState[index],
                      index: index,
                    );
                  },
                ),
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

class ReferralListItem extends StatelessWidget {
  const ReferralListItem({
    super.key,
    required this.model,
    required this.index,
  });
  final UserModel model;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      // margin: const EdgeInsets.all(4),
      decoration:
          customDecoration.copyWith(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //left child

            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 8,
                ),
                Text(
                  (index + 1).toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 16),
                Container(
                  height: 32,
                  width: 32,
                  decoration: customDecoration.copyWith(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(Assets.playerLeaderboardSmall),
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.username,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text('${model.gameStats.totalWins.toString()} Wins',
                        style: Theme.of(context).textTheme.labelSmall),
                  ],
                )
              ],
            ),
            //right child
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '',
                  // '₹',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  '',
                  // '50',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

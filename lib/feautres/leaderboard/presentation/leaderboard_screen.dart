import 'package:auto_route/auto_route.dart';
import 'package:ff_moneyblaster/core/assets.dart';
import 'package:ff_moneyblaster/core/constants.dart';
import 'package:ff_moneyblaster/feautres/leaderboard/shared/provider.dart';
import 'package:ff_moneyblaster/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

import '../../auth/domain/user_model.dart';
import 'widgets/gradient_border_container.dart';

@RoutePage(name: 'LeaderboardScreen')
class LeaderbaordScreen extends ConsumerWidget {
  const LeaderbaordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(leaderboardProvider.select((value) => value.isLoading));
    final state = ref.watch(leaderboardProvider);
    final provider = ref.read(leaderboardProvider.notifier);

    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height,
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
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.35,
            decoration: const BoxDecoration(
              // image: DecorationImage(
              //   scale: 2.1,
              //   image: Image.asset(
              //     Assets.backgroundLeaderboard,
              //     fit: BoxFit.contain,
              //   ).image,
              // ),
              gradient: LinearGradient(
                colors: [Color(0xFFCE3B3B), Color(0xFF5F1237)],
                stops: [0, 1],
                begin: AlignmentDirectional(-1, 0),
                end: AlignmentDirectional(1, 0),
              ),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.11,
                    ),
                    Image.asset(
                      Assets.backgroundLeaderboard,
                      scale: 2.1,
                      // fit: BoxFit.contain,
                    )
                  ],
                ),
                //  Row Widget...
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Leaderboard',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            // Row(
                            //   mainAxisSize: MainAxisSize.min,
                            //   children: [
                            //     Container(
                            //       width: 66,
                            //       height: 22,
                            //       decoration: BoxDecoration(
                            //         color: const Color(0x68FFFFFF),
                            //         borderRadius: BorderRadius.circular(35),
                            //         shape: BoxShape.rectangle,
                            //       ),
                            //       alignment: const AlignmentDirectional(0, 0),
                            //       child: Row(
                            //         mainAxisSize: MainAxisSize.min,
                            //         children: [
                            //           Text(
                            //             'BGMI',
                            //             style: Theme.of(context)
                            //                 .textTheme
                            //                 .bodySmall,
                            //           ),
                            //           const Icon(
                            //             Icons.keyboard_arrow_down,
                            //             color: Colors.white,
                            //             size: 14,
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //     Padding(
                            //       padding: const EdgeInsetsDirectional.fromSTEB(
                            //           12, 0, 0, 0),
                            //       child: Container(
                            //         width: 66,
                            //         height: 22,
                            //         decoration: BoxDecoration(
                            //           color: const Color(0x68FFFFFF),
                            //           borderRadius: BorderRadius.circular(35),
                            //           shape: BoxShape.rectangle,
                            //         ),
                            //         alignment: const AlignmentDirectional(0, 0),
                            //         child: Row(
                            //           mainAxisSize: MainAxisSize.min,
                            //           children: [
                            //             Text(
                            //               'Solo',
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .bodySmall,
                            //             ),
                            //             const Icon(Icons.keyboard_arrow_down,
                            //                 color: Colors.white, size: 14),
                            //           ],
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.sizeOf(context).height * 0.03),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // silver
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 32, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/icons/silver.png',
                                      width: 20,
                                      height: 24,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 58,
                                    height: 58,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 6, 0, 0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: GradientBorderContainer(
                                          width: double.infinity,
                                          height: double.infinity,
                                          radius: 8.0,
                                          colors:
                                              AppColors.silverGradientBorder,
                                          child:
                                              'https://media.wired.com/photos/5b17381815b2c744cb650b5f/master/w_2560%2Cc_limit/GettyImages-134367495.jpg',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 6, 0, 0),
                                    child: Text(
                                      state.topUsers.isNotEmpty
                                          ? state.topUsers[1].username
                                          : "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                            fontSize: 9,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    '${state.topUsers.isNotEmpty ? state.topUsers[1].gameStats.totalKills : ""} kills',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontSize: 8,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            // gold
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'assets/icons/gold.png',
                                    width: 31,
                                    height: 36,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  width: 74,
                                  height: 74,
                                  decoration: const BoxDecoration(),
                                  child: const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 6, 0, 0),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: GradientBorderContainer(
                                        width: double.infinity,
                                        height: double.infinity,
                                        radius: 8.0,
                                        colors: AppColors.goldGradientBorder,
                                        child:
                                            'https://media.wired.com/photos/5b17381815b2c744cb650b5f/master/w_2560%2Cc_limit/GettyImages-134367495.jpg',
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 6, 0, 0),
                                  child: Text(
                                    state.topUsers.isNotEmpty
                                        ? state.topUsers[0].username
                                        : "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontSize: 12,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ),
                                Text(
                                  '${state.topUsers.isNotEmpty ? state.topUsers[0].gameStats.totalKills : ""} kills',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        fontFamily: 'Readex Pro',
                                        color: Colors.white,
                                        fontSize: 12,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            //silver
                            // Generated code for this Column Widget...
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  32, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      'assets/icons/bronze.png',
                                      width: 20,
                                      height: 24,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    width: 58,
                                    height: 58,
                                    decoration: const BoxDecoration(),
                                    child: const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 6, 0, 0),
                                      child: SizedBox(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: GradientBorderContainer(
                                          width: double.infinity,
                                          height: double.infinity,
                                          radius: 8.0,
                                          colors:
                                              AppColors.bronzeGradientBorder,
                                          child:
                                              'https://media.wired.com/photos/5b17381815b2c744cb650b5f/master/w_2560%2Cc_limit/GettyImages-134367495.jpg',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 6, 0, 0),
                                    child: Text(
                                      state.topUsers.isNotEmpty
                                          ? state.topUsers[2].username
                                          : "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontFamily: 'Readex Pro',
                                            color: Colors.white,
                                            fontSize: 9,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Text(
                                    '${state.topUsers.isNotEmpty ? state.topUsers[2].gameStats.totalKills : "0"} kills',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          fontFamily: 'Readex Pro',
                                          color: Colors.white,
                                          fontSize: 8,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          // tab bar
          SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 60.h,
              child: FutureBuilder<List<UserModel>>(
                future: provider.getTop10Users(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        return LeaderboardItem(
                            count: index + 1, user: snapshot.data![index]);
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LeaderboardItem extends StatelessWidget {
  final int count;
  final UserModel user;
  const LeaderboardItem({
    required this.count,
    required this.user,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 70,
      width: double.infinity,
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
                Text(
                  count.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 12),
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
                      user.username,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    Text('${user.gameStats.totalWins} wins',
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
                  user.gameStats.totalKills.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  ' kills',
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

import 'package:auto_route/auto_route.dart';
import 'package:ff_moneyblaster/core/assets.dart';
import 'package:ff_moneyblaster/core/constants.dart';
import 'package:ff_moneyblaster/feautres/home/domain/tournament.dart';
import 'package:ff_moneyblaster/feautres/leaderboard/shared/provider.dart';
import 'package:ff_moneyblaster/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';

@RoutePage(name: 'ResultScreen')
class ResultdScreen extends ConsumerWidget {
  final String title;
  final List<ResultModel?>? result;
  const ResultdScreen({Key? key, required this.title, required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(leaderboardProvider.select((value) => value.isLoading));

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
      child: Column(
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
                      left: 16.0, right: 16, top: 50, bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Results',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )),
          // tab bar
          SizedBox(
            // height: 63.3.h,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const TabBarHome(),
                // const Filter(),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 79.h,
                  child: (result != null && result!.isNotEmpty)
                      ? MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.separated(
                              // physics: NeverScrollableScrollPhysics(),
                              primary: true,
                              shrinkWrap: true,
                              itemCount: result!.length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(height: 12),
                              itemBuilder: (context, index) {
                                return Container(
                                  // height: 75,
                                  width: double.infinity,
                                  // margin: const EdgeInsets.all(4),
                                  decoration: customDecoration.copyWith(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 12),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        //left child
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            result?[index]
                                                        ?.playerRank
                                                        .toString() ==
                                                    '1'
                                                ? Image.asset(Assets.first,
                                                    scale: 2)
                                                : result?[index]
                                                            ?.playerRank
                                                            .toString() ==
                                                        '2'
                                                    ? Image.asset(Assets.second,
                                                        scale: 2)
                                                    : result?[index]
                                                                ?.playerRank
                                                                .toString() ==
                                                            '3'
                                                        ? Image.asset(
                                                            Assets.third,
                                                            scale: 2)
                                                        : Text(
                                                            result?[index]
                                                                    ?.playerRank
                                                                    .toString() ??
                                                                '',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headlineMedium
                                                                ?.copyWith(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                          ),
                                            const SizedBox(width: 12),
                                            // Container(
                                            //   height: 32,
                                            //   width: 32,
                                            //   decoration: customDecoration.copyWith(
                                            //     borderRadius:
                                            //         BorderRadius.circular(8),
                                            //   ),
                                            //   child: Image.asset(
                                            //       Assets.playerLeaderboardSmall),
                                            // ),
                                            const SizedBox(width: 8),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  result?[index]
                                                          ?.playerUsername
                                                          .toString() ??
                                                      '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                ),
                                                Text(
                                                    result?[index]
                                                            ?.playerGameId
                                                            .toString() ??
                                                        '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall),
                                              ],
                                            )
                                          ],
                                        ),
                                        //right child
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            if (result?[index]?.playerKills !=
                                                null)
                                              Text(
                                                result?[index]
                                                        ?.playerKills
                                                        .toString() ??
                                                    '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: AppColors.blue),
                                              ),
                                            if (result?[index]?.playerKills ==
                                                null)
                                              Text(
                                                '0',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: AppColors.blue),
                                              ),
                                            Text(
                                              ' kills',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w700),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )
                      : Center(
                          child: Text(
                            'Check after some time',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                )
              ],
            ),
          ),
        ],
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

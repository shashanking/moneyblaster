import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ff_moneyblaster/core/assets.dart';
import 'package:ff_moneyblaster/core/constants.dart';
import 'package:ff_moneyblaster/feautres/home/domain/tournament.dart';
import 'package:ff_moneyblaster/feautres/home/presentation/widgets/tabbar.dart';
import 'package:ff_moneyblaster/feautres/home/presentation/widgets/tournament_card.dart';
import 'package:ff_moneyblaster/feautres/home/shared/provider.dart';
import 'package:ff_moneyblaster/feautres/wallet/shared/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';

@RoutePage(name: 'HomeScreen')
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void dispose() {
    // final provider = ref.read(homeProvider.notifier);
    // provider.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        ref.watch(homeProvider.select((state) => state.isLoading));
    final homeState = ref.watch(homeProvider);
    final provider = ref.watch(homeProvider.notifier);
    final walletState = ref.watch(walletProvider);

    List<Tournament> ongoingTournaments = homeState.tournaments
        .where((tournament) =>
            provider.getDifferenceInMilliseconds(tournament.dateTime!) > 0 &&
            (tournament.result == null && tournament.lobby != null))
        .toList();
    ongoingTournaments.sort((a, b) => a.dateTime!.compareTo(b.dateTime!));

    List<Tournament> upcomingTournaments = homeState.tournaments
        .where((tournament) =>
            provider.getDifferenceInMilliseconds(tournament.dateTime!) <= 0 &&
            tournament.result == null)
        .toList();

    upcomingTournaments.sort((a, b) => a.dateTime!.compareTo(b.dateTime!));

    List<Tournament> pastTournaments = homeState.tournaments
        .where((tournament) =>
            /**provider.getDifferenceInMilliseconds(tournament.dateTime!) > 0 || */
            tournament.result != null)
        .toList();
    pastTournaments.sort((a, b) => b.dateTime!.compareTo(a.dateTime!));

    List<Widget> adsList = List.generate(
      homeState.adsList.length,
      (index) => GestureDetector(
        onTap: () {
          provider.sendAdInteractionInfo(homeState.adsList[index].uid);
          if (homeState.adsList[index].url.isEmpty) {
            return;
          }
          provider.launchInWebView(
            Uri.parse(homeState.adsList[index].url),
          );
        },
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Card(
                  // margin: const EdgeInsets.all(10),
                  // decoration: const BoxDecoration(color: Colors.white),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      homeState.adsList[index].imagePath,
                      height: MediaQuery.sizeOf(context).height * 0.18,
                      width: MediaQuery.sizeOf(context).width,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 20,
                child: Text(
                  homeState.adsList[index].title ?? '',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              Align(
                // left: 20,
                // top: 54,
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, left: 20),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    child: Text(
                      homeState.adsList[index].description ?? '',
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return SafeArea(
      child: Container(
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
            Container(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height * 0.23,
              decoration: BoxDecoration(
                image: DecorationImage(
                  scale: 2.1,
                  image: Image.asset(
                    Assets.backgroundLeaderboard,
                    fit: BoxFit.contain,
                  ).image,
                ),
                gradient: const LinearGradient(
                  colors: [Color(0xFFCE3B3B), Color(0xFF5F1237)],
                  stops: [0, 1],
                  begin: AlignmentDirectional(-1, 0),
                  end: AlignmentDirectional(1, 0),
                ),
              ),
              child: CarouselSlider(
                items: adsList,
                options: CarouselOptions(
                  autoPlay: true,
                  // aspectRatio: 1,
                  viewportFraction: 1,

                  initialPage: 0,
                  pauseAutoPlayOnTouch: true,
                ),
              ),
            ),
            // tab bar
            SizedBox(
              // height: 64.5.h,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TabBarHome(),
                  // const Filter(),
                  SingleChildScrollView(
                    child: SizedBox(
                      height: 58.h,
                      child: homeState.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : homeState.errorMessage.isNotEmpty
                              ? Text("Error: ${homeState.errorMessage}")
                              : SmartRefresher(
                                  enablePullDown: true,
                                  controller: provider.refreshController,
                                  onRefresh: () {
                                    provider.onRefresh();
                                  },
                                  onLoading: () {
                                    provider.onLoading();
                                  },
                                  child: ListView.separated(
                                      controller: provider.scrollController,
                                      shrinkWrap: true,
                                      itemCount: homeState.selectedHomeTab ==
                                              GameState.upcoming
                                          ? upcomingTournaments.length
                                          : homeState.selectedHomeTab ==
                                                  GameState.ongoing
                                              ? ongoingTournaments.length
                                              : pastTournaments.length,
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              const SizedBox(height: 10),
                                      itemBuilder: (context, index) {
                                        return homeState.selectedHomeTab ==
                                                GameState.upcoming
                                            ? TournamentCard(
                                                bal: walletState
                                                        .user?.wallet.balance ??
                                                    0,
                                                isLessThan24Hours:
                                                    provider.isLessThan24Hours(
                                                        upcomingTournaments[
                                                                index]
                                                            .dateTime!),
                                                gameState:
                                                    homeState.selectedHomeTab,
                                                tournament:
                                                    upcomingTournaments[index],
                                              )
                                            : homeState.selectedHomeTab ==
                                                    GameState.ongoing
                                                ? TournamentCard(
                                                    bal: walletState.user
                                                            ?.wallet.balance ??
                                                        0,
                                                    isLessThan24Hours: provider
                                                        .isLessThan24Hours(
                                                            ongoingTournaments[
                                                                    index]
                                                                .dateTime!),
                                                    gameState: homeState
                                                        .selectedHomeTab,
                                                    tournament:
                                                        ongoingTournaments[
                                                            index],
                                                  )
                                                : TournamentCard(
                                                    bal: walletState.user
                                                            ?.wallet.balance ??
                                                        0,
                                                    isLessThan24Hours: provider
                                                        .isLessThan24Hours(
                                                            pastTournaments[
                                                                    index]
                                                                .dateTime!),
                                                    gameState: homeState
                                                        .selectedHomeTab,
                                                    tournament:
                                                        pastTournaments[index],
                                                  );
                                      }),
                                ),
                    ),
                  )
                ],
              ),
            ),
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

// auth_notifier.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_moneyblaster/feautres/auth/domain/user_model.dart';
import 'package:ff_moneyblaster/feautres/home/application/home_state.dart';
import 'package:ff_moneyblaster/feautres/home/domain/ad.dart';
import 'package:ff_moneyblaster/feautres/home/domain/i_home_repository.dart';
import 'package:ff_moneyblaster/feautres/home/domain/tournament.dart';
import 'package:ff_moneyblaster/feautres/home/presentation/widgets/tournament_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:riverpod/riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  final IHomeRepository _homeRepository;

  HomeNotifier(
    this._homeRepository,
  ) : super(const HomeState()) {
    fetchTournaments();
    updateStateTopUsers();
    fetchAds();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  ScrollController scrollController = ScrollController();

  @override
  void dispose() async {
    scrollController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  void updateStateTopUsers() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('appusers')
        .orderBy('gameStats.totalWinAmount', descending: true)
        .limit(3)
        .get();

    List<UserModel> topUsers = [];
    for (var doc in querySnapshot.docs) {
      topUsers.add(UserModel.fromJson(doc.data() as Map<String, dynamic>));
    }

    state = state.copyWith(topUsers: topUsers);
  }

  void onRefresh() async {
    // monitor network fetch
    // Store current scroll position
    double scrollPosition = scrollController.position.pixels;
    if (mounted) await fetchTournaments();
    // if failed,use refreshFailed()
    refreshController.refreshCompleted();
    // await fetchAds();
    // scrollController.jumpTo(_scrollPosition);
  }

  void onLoading() async {
    // monitor network fetch
    double scrollPosition = scrollController.position.pixels;

    // if failed,use loadFailed(),if no data return,use LoadNodata()

    refreshController.loadComplete();
    // scrollController.jumpTo(_scrollPosition);
  }

  void selectTab(GameState tab) {
    state = state.copyWith(selectedHomeTab: tab);
  }

  void selectProfileTab(ProfileTabState tab) {
    state = state.copyWith(selectedProfileTab: tab);
  }

  int getDifferenceInMilliseconds(DateTime inputTime) {
    DateTime currentTime = DateTime.now();
    Duration difference = currentTime.difference(inputTime);
    return difference.inMilliseconds;
  }

  bool isLessThan24Hours(DateTime dateTime) {
    DateTime now = DateTime.now();
    int differenceInMilliseconds =
        now.difference(dateTime).inMilliseconds.abs();
    int twentyFourHoursInMilliseconds =
        const Duration(hours: 24).inMilliseconds;
    bool isLess = differenceInMilliseconds < twentyFourHoursInMilliseconds;
    DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    String formatted = formatter.format(dateTime);
    debugPrint(formatted);

    return isLess;
  }

  Future<void> fetchTournaments() async {
    state = state.copyWith(isLoading: true);
    try {
      List<Tournament> tournaments = await _homeRepository.getTournaments();
      state = state.copyWith(tournaments: tournaments, isLoading: false);
      debugPrint('fetched tournaments successfully');
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> selectTournament(Tournament t) async {
    state = state.copyWith(selectedTournament: t);
    debugPrint(t.uid);
  }

  Future<void> registerForTournament(
      {required Tournament t, List<String>? squadPlayerIds}) async {
    state = state.copyWith(isLoading: true);
    try {
      final id = _auth.currentUser!.uid;
      await fetchTournaments();
      final tournament = await _homeRepository.registerForTournament(
          tournamentId: state.selectedTournament!.uid!,
          squadPlayerIds: squadPlayerIds);

      // state = state.copyWith(selectedTournament: t);
      if (tournament.registeredPlayersId.contains(id)) {
        await drawWallet(tournament.entryFee!);
      }
      await fetchTournaments();
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> drawWallet(int val) async {
    state = state.copyWith(isLoading: true);
    try {
      final tournament = await _homeRepository.drawWallet(val: val);
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString(), isLoading: false);
    }
  }

  Future<void> fetchAds() async {
    state = state.copyWith(isLoading: true);
    try {
      var collection = FirebaseFirestore.instance.collection('ads');
      var snapshot = await collection.get();
      // var docs = snapshot.docs;
      // var data = docs.first.data();
      final adsList =
          snapshot.docs.map((doc) => Ad.fromJson(doc.data())).toList();
      state = state.copyWith(adsList: adsList, isLoading: false);
      // print(data);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<void> launchInWebView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  // Add or update user's interactions with an ad
  Future<void> sendAdInteractionInfo(String adId) async {
    // state = state.copyWith(isLoading: true);
    int timesClicked = 0;
    String currentUserId = _auth.currentUser!.uid;
    try {
      var adDoc = FirebaseFirestore.instance.collection('ads').doc(adId);
      var adSnapshot = await adDoc.get();

      final adClickedData = adSnapshot.data();

      if (adClickedData != null && adClickedData.containsKey("adDetails")) {
        List<dynamic> adDetails = adClickedData["adDetails"];

        var userAdDetails = adDetails.firstWhere(
          (detail) => detail!["userId"] == currentUserId,
          orElse: () => null,
        );

        if (userAdDetails != null) {
          // If user's ad details exist, update timesClicked
          timesClicked = userAdDetails["timesClicked"] + 1;
          // Update user's ad details
          adDetails.removeWhere((detail) => detail!["userId"] == currentUserId);
          adDetails
              .add({"userId": currentUserId, "timesClicked": timesClicked});
        } else {
          // If user's ad details don't exist, create new details
          timesClicked = 1;
          adDetails
              .add({"userId": currentUserId, "timesClicked": timesClicked});
        }

        await adDoc.update({"adDetails": adDetails});
      } else {
        // If "adDetails" array doesn't exist, create it with user's interaction
        timesClicked = 1;
        await adDoc.set({
          "adDetails": [
            {"userId": currentUserId, "timesClicked": timesClicked}
          ]
        }, SetOptions(merge: true));
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}

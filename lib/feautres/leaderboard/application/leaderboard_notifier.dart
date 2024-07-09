import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_moneyblaster/feautres/auth/domain/user_model.dart';
import 'package:ff_moneyblaster/feautres/leaderboard/application/leaderboard_state.dart';
import 'package:riverpod/riverpod.dart';

class LeaderboardNotifier extends StateNotifier<LeaderboardState> {
  // final ILeaderboardRepository _LeaderboardRepository;

  LeaderboardNotifier(/*this._LeaderboardRepository*/)
      : super(const LeaderboardState()) {
    updateStateTopUsers();
  }

  Future<List<UserModel>> getTop10Users() async {
    // state = state.copyWith(isLoading: true);
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('appusers')
        .orderBy('gameStats.totalKills', descending: true)
        .limit(10)
        .get();

    // Extract data from QuerySnapshot and convert to List<UserModel>
    List<UserModel> topUsers = [];
    for (var doc in querySnapshot.docs) {
      topUsers.add(UserModel.fromJson(doc.data() as Map<String, dynamic>));
    }

    return topUsers;
  }

  void updateStateTopUsers() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('appusers')
        .orderBy('gameStats.totalKills', descending: true)
        .limit(3)
        .get();

    List<UserModel> topUsers = [];
    for (var doc in querySnapshot.docs) {
      topUsers.add(UserModel.fromJson(doc.data() as Map<String, dynamic>));
    }

    state = state.copyWith(topUsers: topUsers);
  }
}

import 'package:ff_moneyblaster/feautres/leaderboard/application/leaderboard_notifier.dart';
import 'package:ff_moneyblaster/feautres/leaderboard/application/leaderboard_state.dart';

import 'package:riverpod/riverpod.dart';

final leaderboardProvider =
    StateNotifierProvider.autoDispose<LeaderboardNotifier, LeaderboardState>(
        (ref) => LeaderboardNotifier());

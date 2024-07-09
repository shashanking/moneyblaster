import 'package:ff_moneyblaster/feautres/auth/domain/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_state.freezed.dart';

@freezed
class LeaderboardState with _$LeaderboardState {
  const factory LeaderboardState({
    @Default(false) bool isLoading,
    @Default([]) List<UserModel> topUsers,
  }) = _LeaderboardState;

  const LeaderboardState._();
}

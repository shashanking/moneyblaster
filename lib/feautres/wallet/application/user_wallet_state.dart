import 'package:ff_moneyblaster/feautres/auth/domain/user_model.dart';
import 'package:ff_moneyblaster/feautres/wallet/application/wallet_notifier.dart';
import 'package:ff_moneyblaster/feautres/wallet/domain/qr_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_wallet_state.freezed.dart';

@freezed
class UserWalletState with _$UserWalletState {
  const factory UserWalletState({
    @Default(WalletTab.withdraw) WalletTab selectedWalletTab,
    @Default(false) bool isLoading,
    UserModel? user,
    @Default('') String errorMessage,
    @Default([]) List<UserModel> referredList,
    QrModel? qr,
    @Default(0) int adClicked,
    double? lastAdReward,
  }) = _UserWalletState;

  const UserWalletState._();
}

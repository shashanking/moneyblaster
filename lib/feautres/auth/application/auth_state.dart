import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(false) bool isLoading,
    @Default(false) bool isUser,
    @Default(false) bool isUserVerified,
    @Default(false) bool isOtpSent,
    @Default('') String? gameOptionSelected,
    @Default('') String number,
  }) = _AuthState;

  const AuthState._();
}

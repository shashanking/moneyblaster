import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_state.freezed.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    @Default(false) bool isLoading,
    @Default([]) List<Map<String, dynamic>> notifications,
  }) = _NotificationState;

  const NotificationState._();
}

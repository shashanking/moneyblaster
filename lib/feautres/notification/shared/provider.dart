import 'package:ff_moneyblaster/feautres/notification/application/notification_notifier.dart';
import 'package:ff_moneyblaster/feautres/notification/application/notification_state.dart';

import 'package:riverpod/riverpod.dart';

final notificationProvider =
    StateNotifierProvider.autoDispose<NotificationNotifier, NotificationState>(
        (ref) => NotificationNotifier());

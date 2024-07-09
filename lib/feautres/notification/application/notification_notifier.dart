import 'dart:convert';

import 'package:ff_moneyblaster/feautres/notification/application/notification_state.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationNotifier extends StateNotifier<NotificationState> {

  NotificationNotifier() : super(const NotificationState()) {
    loadNotifications();
  }

  void addNotification(Map<String, dynamic> notification) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> notifications = prefs.getStringList('notifications') ?? [];
    notifications.add(notification.toString());
    await prefs.setStringList('notifications', notifications);

    state = NotificationState(
      isLoading: state.isLoading,
      notifications: [...state.notifications, notification],
    );
  }

  Future<void> loadNotifications() async {
    state = const NotificationState(
      isLoading: true,
     
    );
    final prefs = await SharedPreferences.getInstance();
    List<String> notifications = prefs.getStringList('notifications') ?? [];

    List<Map<String, dynamic>> notificationList = notifications.map((notification) {
      return Map<String, dynamic>.from(jsonDecode(notification));
    }).toList();

    state = NotificationState(
      isLoading: false,
      notifications: notificationList,
    );
  }

  Future<void> clearNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('notifications');

    state = NotificationState(
      isLoading: state.isLoading,
      notifications: [],
    );
  }
}

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FCMService {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _firestore = FirebaseFirestore.instance;
  final ProviderContainer _providerContainer;

  FCMService(this._providerContainer);

  final AndroidNotificationDetails _androidNotificationDetails =
      const AndroidNotificationDetails(
    "_id",
    "_name",
    channelDescription: "_description",
    importance: Importance.max,
    priority: Priority.max,
    enableVibration: true,
    enableLights: true,
    playSound: true,
    channelShowBadge: true,
    styleInformation: BigTextStyleInformation(''),
  );

  static const DarwinNotificationDetails _darwinNotificationDetails =
      DarwinNotificationDetails(
    presentSound: true,
    presentBadge: true,
    presentAlert: true,
  );

  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    // Initialize FlutterLocalNotificationsPlugin
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _notificationsPlugin.initialize(initializationSettings);

    // Request permission for iOS
    _firebaseMessaging.requestPermission();

    // Get FCM token
    final fcmToken = await _firebaseMessaging.getToken();
    debugPrint('Token : $fcmToken');

    // Store FCM token in Firestore
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('appusers')
          .doc(user.uid)
          .get();
      if (doc.exists) {
        await _firestore
            .collection('appusers')
            .doc(user.uid)
            .set({'fcmToken': fcmToken}, SetOptions(merge: true));
      }
    }

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    // Initialize foreground handling
    initForeground();
  }

  Future<void> storeNotificationData(String notificationBody) async {
    final DateFormat formatter = DateFormat('hh.mm a, d MMM, yyyy');
    final String formattedTimestamp = formatter.format(DateTime.now());

    final prefs = await SharedPreferences.getInstance();
    List<String> notifications = prefs.getStringList('notifications') ?? [];
    notifications.add(jsonEncode({
      'msg': notificationBody,
      'timestamp': formattedTimestamp,
    }));
    await prefs.setStringList('notifications', notifications);
  }

  Future<void> handleMessage(RemoteMessage? message) async {
    if (message == null) return;

    debugPrint(
        "Foreground Message: Title: ${message.notification?.title}, Body: ${message.notification?.body}, Data: ${message.data}");

    await storeNotificationData(message.notification?.body ?? '');

    displayNotification(message);
  }

  Future<void> displayNotification(RemoteMessage message) async {
    NotificationDetails notificationDetails = NotificationDetails(
      android: _androidNotificationDetails,
      iOS: _darwinNotificationDetails,
    );

    final uniqueId = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    await _notificationsPlugin.show(
      uniqueId,
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
      payload: "jsonEncode(message.data)",
    );
  }

  Future<void> initForeground() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessage.listen(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }

  static Future<void> handleBackgroundMessage(RemoteMessage? message) async {
    debugPrint(
        "Background Message: Title: ${message?.notification?.title}, Body: ${message?.notification?.body}, Data: ${message?.data}");
  }
}

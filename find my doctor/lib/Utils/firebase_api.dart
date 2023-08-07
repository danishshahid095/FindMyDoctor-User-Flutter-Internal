import 'dart:io';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../App/locator.dart';
import '../ViewModels/prefrences_view_model.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}

class FirebaseApi {
  var prefService = locator<PreferencesViewModel>();
  final _firebaseMessaging = FirebaseMessaging.instance;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  var initializationSettingsIOS = DarwinInitializationSettings();

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final FCMToken = await _firebaseMessaging.getToken();
    print('FCMToken: $FCMToken');
    prefService.saveFCMToken(FCMToken!);

    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showNotification(message);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('A new onMessageOpenedApp event was published!');
    });
  }

  Future<void> showNotification(RemoteMessage message) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      //'channel_description',
      importance: Importance.high,
      priority: Priority.high,
    );
    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
            presentAlert: true, presentBadge: true, presentSound: true);
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: darwinNotificationDetails);

    await flutterLocalNotificationsPlugin.show(
      Random.secure().nextInt(100000),
      message.notification?.title,
      message.notification?.body,
      platformChannelSpecifics,
      payload: message.data.toString(),
    );
  }
}
















// import 'package:firebase_messaging/firebase_messaging.dart';
// import '../App/locator.dart';
// import '../ViewModels/prefrences_view_model.dart';

// Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   print('Title: ${message.notification?.title}');
//   print('Body: ${message.notification?.body}');
//   print('Payload: ${message.data}');
// }

// class FirebaseApi {
//   var prefService = locator<PreferencesViewModel>();
//   final _firebaseMessaging = FirebaseMessaging.instance;

//   Future<void> initNotifications() async {
//     await _firebaseMessaging.requestPermission();
//     final FCMToken = await _firebaseMessaging.getToken();
//     forgroundMessage();
//     print('FCMToken: $FCMToken');
//     prefService.saveFCMToken(FCMToken!);
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//     //FirebaseMessaging.onMessage.listen((message) {});
//   }

//   Future forgroundMessage() async {
//     await _firebaseMessaging.setForegroundNotificationPresentationOptions(
//         alert: true, badge: true, sound: true);
//   }
// }

import 'package:firebase_messaging/firebase_messaging.dart';
import '../App/locator.dart';
import '../ViewModels/prefrences_view_model.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message .notification?.title}');
  print('Body: ${message.notification?.body}');
  print ('Payload: ${message .data}');
}

class FirebaseApi {
  var prefService = locator<PreferencesViewModel>();
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final FCMToken = await _firebaseMessaging.getToken();
    forgroundMessage();
    print('FCMToken: $FCMToken');
    prefService.saveFCMToken(FCMToken!);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  Future forgroundMessage() async {
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
  }
}
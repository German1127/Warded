import 'package:firebase_messaging/firebase_messaging.dart';

class FCMService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<String?> getToken() async {
    return await _firebaseMessaging.getToken();
  }

  Future<void> initializeFCM() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    String? token = await _firebaseMessaging.getToken();

    print('Token FCM: $token');
  }
}
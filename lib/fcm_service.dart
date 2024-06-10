import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FCMService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<String?> getTokenAndSaveToFirestore() async {
    await _firebaseMessaging.requestPermission();

    String? token = await _firebaseMessaging.getToken();

    if (token != null) {
      await saveTokenToFirestore(token);
    }

    return token;
  }

  Future<void> saveTokenToFirestore(String token) async {
    try {
      final currentUser = FirebaseFirestore.instance.collection('users').doc('userId');

      await currentUser.set({'token': token});
    } catch (e) {
      print('Error al guardar el token en Firestore: $e');
    }
  }
}
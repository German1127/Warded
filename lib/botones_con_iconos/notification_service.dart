import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationService {
  Future<void> sendNotification(String message) async {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

    String? senderToken = await _firebaseMessaging.getToken();

    List<String> tokens = [];
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('users').get();
    for (var doc in snapshot.docs) {
      String token = doc['token'];
      if (token != senderToken) {
        tokens.add(token);
      }
    }

    final response = await http.post(
      Uri.parse('https://779f-2800-a4-8ae-5700-2df9-32ba-67ac-d73a.ngrok-free.app/send-notification'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'tokens': tokens,
        'message': message,
        'senderToken': senderToken,
      }),
    );

    if (response.statusCode == 200) {
      print('Notificación enviada');
    } else {
      print('Error al enviar notificación');
    }
  }
}
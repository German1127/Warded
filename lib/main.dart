import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitle/features/mis_grupos/cubic/mis_grupos_cubit.dart';
import 'package:flutter/services.dart';
import 'package:untitle/login.dart';
import 'package:url_launcher/url_launcher.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'fcm_service.dart';
import 'botones_con_iconos/notification_service.dart';

final db = FirebaseFirestore.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
  ));

  FCMService fcmService = FCMService();
  String? token = await fcmService.getTokenAndSaveToFirestore();

  await setupInteractedMessage();

  runApp(
    BlocProvider(
      create: (context) => MisGruposCubit()..getVecinos(),
      child: WardedAPP(),
    ),
  );
}

Future<void> setupInteractedMessage() async {
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    _handleMessage(message);
  });
}

void _handleMessage(RemoteMessage message) {
  if (message.data.containsKey('location')) {
    String location = message.data['location'];
    _launchMaps(location);
  }
}

void _launchMaps(String location) async {
  final url = 'https://www.google.com/maps/search/?api=1&query=$location';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class WardedAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Warded',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.green,
          ),
        ),
      ),
      home: Login(),
    );
  }
}
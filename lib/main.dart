import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Warded/features/mis_grupos/cubic/mis_grupos_cubit.dart';
import 'package:flutter/services.dart';
import 'package:Warded/login.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'fcm_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:url_launcher/url_launcher.dart';
import 'funciones_notificacion.dart';

final db = FirebaseFirestore.instance;
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

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

  // notificaciones locales
  AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('logo');
  InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: selectNotification);

  runApp(
    BlocProvider(
      create: (context) => MisGruposCubit()..getVecinos(),
      child: WardedAPP(),
    ),
  );
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Warded/features/mis_grupos/cubic/mis_grupos_cubit.dart';
import 'package:flutter/services.dart';
import 'package:Warded/login.dart';
import 'features/mis_grupos/models/vecino.dart';
import 'features/mis_grupos/models/grupo.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:Warded/fcm_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'funciones_notificacion.dart';


final db = FirebaseFirestore.instance;
Vecino currentUser = Vecino("", "", "", "", "");
Grupo currentGroup = Grupo("", []);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
  ));

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  String? token = await messaging.getToken();
  print('Token de notificación: $token');

  FCMService fcmService = FCMService();
  String? savedToken = await fcmService.getTokenAndSaveToFirestore();

  // Configuración de notificaciones locales
  AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('logo');
  InitializationSettings initializationSettings =
  InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onDidReceiveNotificationResponse: selectNotification);

  runApp(
    BlocProvider(
      create: (context) => MisGruposCubit()..getVecinos(),
      child: const WardedAPP(),
    ),
  );
}

class WardedAPP extends StatelessWidget {
  const WardedAPP();

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
      home: const Login(),
    );
  }
}

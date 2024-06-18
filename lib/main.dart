import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Warded/fcm_service.dart';
import 'package:Warded/features/mis_grupos/cubic/mis_grupos_cubit.dart';
import 'package:Warded/login.dart';
import 'package:Warded/pagina_principal.dart';
import 'package:Warded/onboarding_screen.dart';
import 'funciones_notificacion.dart';
import 'features/mis_grupos/models/vecino.dart';
import 'features/mis_grupos/models/grupo.dart';
import 'firebase_options.dart';


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

  // Verificar si se ha mostrado el tutorial
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seenOnboarding = prefs.getBool('seenOnboarding') ?? false;

  Widget initialRoute;
  if (seenOnboarding) {
    // Si ya se ha visto el tutorial, muestra la pantalla de login
    initialRoute = const Login();
  } else {
    // Si no se ha visto el tutorial, muestra el tutorial
    initialRoute = OnboardingScreen();
  }

  runApp(
    BlocProvider(
      create: (context) => MisGruposCubit()..getVecinos(),
      child: WardedAPP(initialRoute),
    ),
  );
}

class WardedAPP extends StatelessWidget {
  final Widget initialRoute;

  const WardedAPP(this.initialRoute);

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
      home: initialRoute,
    );
  }
}
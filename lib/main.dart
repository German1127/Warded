import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitle/features/mis_grupos/cubic/mis_grupos_cubit.dart';
import 'package:untitle/login.dart';
import 'package:untitle/fcm_service.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
  ));

  FCMService().initializeFCM();

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
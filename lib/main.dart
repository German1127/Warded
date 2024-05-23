import 'package:flutter/material.dart';
import 'package:untitle/CrearCuenta.dart';
import 'package:untitle/Login.dart';
import 'package:untitle/PaginaPrincipal.dart';
import 'package:untitle/features/mis_grupos/view/mis_grupos_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Warded',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MisGruposPage(),
    );
  }
}

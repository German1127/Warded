import 'package:flutter/material.dart';
import 'package:untitle/features/mis_grupos/view/widgets/mis_grupos_loading.dart';

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
      home: MisGruposLoading(),
    );
  }
}

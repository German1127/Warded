import 'package:flutter/material.dart';
import 'package:Warded/features/mis_grupos/view/mis_grupos_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // Routeo
      // Theme
      home: MisGruposPage(),
    );
  }
}

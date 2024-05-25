import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitle/features/mis_grupos/view/mis_grupos_page.dart';
import 'package:untitle/bloc/estado_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => GrupoBloc(),
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
      ),
      home: MisGruposPage(),
    );
  }
}

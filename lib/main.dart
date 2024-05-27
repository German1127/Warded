import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitle/PaginaPrincipal.dart';
import 'package:untitle/features/mis_grupos/cubic/mis_grupos_cubit.dart';


void main() {
  runApp(
    BlocProvider(
      create: (context) => MisGruposCubit(),
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
      home: PaginaPrincipal(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:untitle/features/mis_grupos/cubic/mis_grupos_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BotonAbandonarGrupo extends StatelessWidget {
  final String text;

  const BotonAbandonarGrupo({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<MisGruposCubit>().abandonarGrupo(2);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.green,
        ),
      ),
    );
  }
}
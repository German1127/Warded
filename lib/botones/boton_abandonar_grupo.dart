import 'package:flutter/material.dart';
import 'package:Warded/features/mis_grupos/cubic/mis_grupos_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BotonAbandonarGrupo extends StatelessWidget {
  final String text;

  const BotonAbandonarGrupo({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<MisGruposCubit>().abandonarGrupo(1);
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
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
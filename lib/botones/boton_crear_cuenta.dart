import 'package:flutter/material.dart';
import 'package:Warded/crear_cuenta.dart';
import 'package:Warded/features/mis_grupos/models/grupo.dart';
import 'package:Warded/features/mis_grupos/models/vecino.dart';

import '../main.dart';

class BotonCrearCuenta extends StatelessWidget {
  final String text;

  const BotonCrearCuenta({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        currentUser = await Vecino.fromFirestore("1");
        currentGroup = await Grupo.fromFirestore(currentUser.groupId);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const CrearCuenta())
        );
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
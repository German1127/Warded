import 'package:flutter/material.dart';

class BotonMenuPantallaGrupo extends StatelessWidget {
  final String text;

  const BotonMenuPantallaGrupo ({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Aca va la funcion que le des al tocar el boton
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
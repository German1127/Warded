import 'package:flutter/material.dart';

class BotonIniSesion extends StatelessWidget {
  final String text;

  const BotonIniSesion({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Aca va la funcion que le des al tocar el boton
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
import 'package:flutter/material.dart';

class BotonIniSesion extends StatelessWidget {
  final String text;

  const BotonIniSesion({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Aca va la funcion que le des al tocar el boton
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
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
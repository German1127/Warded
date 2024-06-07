import 'package:flutter/material.dart';
import 'package:untitle/crear_cuenta.dart';

class BotonCrearCuenta extends StatelessWidget {
  final String text;

  const BotonCrearCuenta({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
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
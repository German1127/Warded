import 'package:flutter/material.dart';
import 'package:untitle/crear_cuenta.dart';

class BotonCrearCuenta extends StatelessWidget {
  final String text;

  const BotonCrearCuenta({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CrearCuenta())
        );
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
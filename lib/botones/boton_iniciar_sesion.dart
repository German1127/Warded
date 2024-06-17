import 'package:flutter/material.dart';
import 'package:Warded/pagina_principal.dart';

class BotonIniSesion extends StatelessWidget {
  final String text;

  const BotonIniSesion({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaginaPrincipal())
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
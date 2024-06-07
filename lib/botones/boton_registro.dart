import 'package:flutter/material.dart';
import 'package:untitle/pagina_principal.dart';

class BotonRegistro extends StatelessWidget {
  final String text;

  const BotonRegistro({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PaginaPrincipal())
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
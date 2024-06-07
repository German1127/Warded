import 'package:flutter/material.dart';
import 'package:untitle/pagina_QR.dart';

class BotonInvitarGrupo extends StatelessWidget {
  final String text;

  const BotonInvitarGrupo({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PaginaQR()),
        );
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
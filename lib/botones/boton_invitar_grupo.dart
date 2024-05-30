import 'package:flutter/material.dart';
import 'package:untitle/pagina_QR.dart';

class BotonInvitarGrupo extends StatelessWidget {
  final String text;

  const BotonInvitarGrupo({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaginaQR()),
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
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
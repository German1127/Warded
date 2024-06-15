import 'package:flutter/material.dart';
import 'package:Warded/pagina_principal.dart';

class BotonCasita extends StatelessWidget {
  final String text;

  const BotonCasita({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.home,
        color: Colors.green,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaginaPrincipal()),
        );
      },
    );
  }
}

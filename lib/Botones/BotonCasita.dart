import 'package:flutter/material.dart';
import 'package:untitle/PaginaPrincipal.dart';

class BotonCasita extends StatelessWidget {
  final String text;

  const BotonCasita({Key? key, required this.text}) : super(key: key);

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

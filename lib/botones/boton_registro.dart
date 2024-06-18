import 'package:flutter/material.dart';
import 'package:Warded/pagina_principal.dart';

class BotonRegistro extends StatelessWidget {
  final String text;

  const BotonRegistro({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Cuenta creada satisfactoriamente',
              style: TextStyle(color: Colors.green, fontSize: 18.0),
            ),
            backgroundColor: Colors.black,
            duration: Duration(seconds: 2),
          ),
        );

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaginaPrincipal()),
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
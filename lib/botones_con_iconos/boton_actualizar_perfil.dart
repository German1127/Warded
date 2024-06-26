import 'package:flutter/material.dart';

class BotonActualizarPerfil extends StatelessWidget {
  const BotonActualizarPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('¡Aca pongan lo que quieran que haga el boton SIN EL PRINT!');
      },
      child: Container(
        width: 100.0,
        height: 100.0,
        padding: const EdgeInsets.all(2.0),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/IconoActualizarPerfil.png',
              fit: BoxFit.contain,
              height: 70.0,
            ),
            const Text(
              'Actualizar perfil',
              style: TextStyle(
                color: Colors.green,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

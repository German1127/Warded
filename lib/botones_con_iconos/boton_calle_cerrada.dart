import 'package:flutter/material.dart';

class BotonCalleCerrada extends StatelessWidget {
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
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(0.0),
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/IconoCalleCerrada.png',
              fit: BoxFit.contain,
              height: 70.0,
            ),
            const Text(
              'Calle cerrada',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

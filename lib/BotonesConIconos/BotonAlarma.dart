import 'package:flutter/material.dart';

class BotonAlarma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('¡Aca pongan lo que quieran que haga el boton SIN EL PRINT!');
      },
      child: Container(
        width: 70.0,
        height: 70.0,
        padding: const EdgeInsets.all(2.0),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        child: Image.asset(
          'assets/BotonAlarma.png',
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}

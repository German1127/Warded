import 'package:flutter/material.dart';

class BotonAlarmaSalud extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('¡Aca pongan lo que quieran que haga el boton SIN EL PRINT!');
      },
      child: Container(
        width: 200.0,
        height: 200.0,
        padding: const EdgeInsets.all(3.0),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
        ),
        child: Image.asset(
          'assets/BotonAlarmaSalud.png',
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}

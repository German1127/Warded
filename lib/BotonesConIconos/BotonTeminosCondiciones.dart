import 'package:flutter/material.dart';

class BotonTerminoCondiciones extends StatelessWidget {
  final VoidCallback onTap;

  BotonTerminoCondiciones({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100.0,
        height: 100.0,
        padding: const EdgeInsets.all(2.0),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/IconoTerminosCondiciones.png',
              fit: BoxFit.contain,
              height: 70.0,
            ),
            const Text(
              'Uso de datos',
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

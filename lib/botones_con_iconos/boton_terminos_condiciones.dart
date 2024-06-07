import 'package:flutter/material.dart';
import 'package:untitle/terminos_condiciones.dart';

class BotonTerminosCondiciones extends StatelessWidget {
  const BotonTerminosCondiciones({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TerminosCondiciones()),
        );
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

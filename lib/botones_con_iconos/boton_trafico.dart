import 'package:flutter/material.dart';
import 'package:Warded/funciones_notificacion.dart';

class BotonTrafico extends StatelessWidget {
  const BotonTrafico({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        {showNotification();}
      },
      child: Container(
        width: 100.0,
        height: 100.0,
        padding: const EdgeInsets.all(2.0),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/IconoTrafico.png',
              fit: BoxFit.contain,
              height: 70.0,
            ),
            const Text(
              'Trafico',
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

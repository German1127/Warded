import 'package:flutter/material.dart';

void main() {
  runApp(const Fondo());
}

class Fondo extends StatelessWidget {
  const Fondo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "",
            style: TextStyle(color: Colors.green),
          ),
          backgroundColor: Colors.black,
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/Fondo.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: Text(
                  'Contenido en el fondo',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'Campos/CampoRegistroNombre.dart';
import 'Campos/CampoRegistroPass.dart';
import 'Botones/BotonRegistro.dart';

void main() {
  runApp(RegistroScreen());
}

class RegistroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Warded',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Fondo.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20.0),
                CampoRegistroNombre(labelText: 'Nombre de usuario'),
                SizedBox(height: 20.0),
                CampoRegistroPass(labelText: 'Contraseña'),
                SizedBox(height: 20.0),
                BotonRegistro(text: 'Registrarse'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'Botones/BotonIniciarSesion.dart';
import 'Campos/CampoBase.dart';
import 'Campos/CampoContraseña.dart';
import 'Botones/BotonCrearCuenta.dart';

void main() {
  runApp(LoginScreen());
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
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
                CampoNombreDeUsuario(labelText: 'Nombre de usuario'),
                SizedBox(height: 20.0),
                CampoPass(),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    BotonIniSesion(text: 'Iniciar sesión'),
                    SizedBox(width: 20.0),
                    BotonCrearCuenta(text: 'Crear cuenta'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'Botones/BotonIniciarSesion.dart';
import 'Campos/CampoNombreDeUsuario.dart';
import 'Campos/CampoContraseña.dart';
import 'Botones/BotonCrearCuenta.dart';

void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
          height: screenSize.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Fondo.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: const AssetImage('assets/Logo.jpg'),
                    height: screenSize.height * 0.4,
                    width: screenSize.width * 0.4,
                  ),
                  const SizedBox(height: 20.0),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

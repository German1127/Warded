import 'package:flutter/material.dart';
import 'Botones/boton_iniciar_sesion.dart';
import 'Campos/campo_nombre_de_usuario.dart';
import 'Campos/campo_contraseña.dart';
import 'Botones/boton_crear_cuenta.dart';


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
      );
  }
}

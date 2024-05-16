import 'package:flutter/material.dart';
import 'Campos/CampoRegistroNombre.dart';
import 'Campos/CampoRegistroPass.dart';
import 'Campos/CampoRegistroConfirmarPass.dart';
import 'Botones/BotonRegistro.dart';

void main() {
  runApp(Registro());
}

class Registro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crear perfil',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Crear perfil',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Container(
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
                        Text(
                          'Ingresa una foto para que podamos reconocerte',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 20.0),
                        CampoRegistroNombre(labelText: 'Nombre'),
                        SizedBox(height: 20.0),
                        CampoRegistroPass(labelText: 'Pass'),
                        SizedBox(height: 20.0),
                        CampoRegistroConfirmarPass(labelText: 'Confirma el pass'),
                        SizedBox(height: 20.0),
                        BotonRegistro(text: 'Listo'),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

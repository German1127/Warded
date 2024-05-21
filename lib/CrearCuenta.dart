import 'package:flutter/material.dart';
import 'Campos/CampoRegistroNombre.dart';
import 'Campos/CampoRegistroPass.dart';
import 'Campos/CampoRegistroConfirmarPass.dart';
import 'Botones/BotonRegistro.dart';

void main() {
  runApp(CrearCuenta());
}

class CrearCuenta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

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
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: screenSize.height * 0.3,
                          child: const Image(
                            image: AssetImage('assets/IconoAgregarFoto.jpg'),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        const Text(
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

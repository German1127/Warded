import 'package:flutter/material.dart';
import 'Campos/campo_registro_nombre.dart';
import 'Campos/campo_registro_pass.dart';
import 'Campos/campo_registro_confirmar_pass.dart';
import 'Botones/boton_registro.dart';


class CrearCuenta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
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
                        const SizedBox(height: 20.0),
                        const Text(
                          'Ingresa una foto para que podamos reconocerte',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 20.0),
                        const CampoRegistroNombre(labelText: 'Nombre'),
                        const SizedBox(height: 20.0),
                        const CampoRegistroPass(labelText: 'Pass'),
                        const SizedBox(height: 20.0),
                        const CampoRegistroConfirmarPass(
                            labelText: 'Confirma el pass'),
                        const SizedBox(height: 20.0),
                        const BotonRegistro(text: 'Listo'),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
  }
}

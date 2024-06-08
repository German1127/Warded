import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'Campos/campo_registro_nombre.dart';
import 'Campos/campo_registro_pass.dart';
import 'Campos/campo_registro_confirmar_pass.dart';
import 'Botones/boton_registro.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future<void> _takePicture() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imageFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );

    if (imageFile == null) {
      return;
    }

    setState(() {
      _storedImage = File(imageFile.path);
    });

    // aca pongan el código para subir la imagen a la base de datos
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
            _storedImage!,
            fit: BoxFit.fill,
            width: double.infinity,
          )
              : const Text(
            'Ninguna imagen seleccionada',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green),
          ),
        ),
        TextButton.icon(
          icon: const Icon(Icons.image),
          label: const Text('Selecciona una imagen de tu Galeria', style: TextStyle(fontSize: 15)),
          style: TextButton.styleFrom(
            foregroundColor: Colors.green,
          ),
          onPressed: _takePicture,
        ),
      ],
    );
  }
}

class CrearCuenta extends StatelessWidget {
  const CrearCuenta({super.key});

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
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: screenSize.height * 0.3,
                        child: const ImageInput(),
                      ),
                      const SizedBox(height: 0.0),
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

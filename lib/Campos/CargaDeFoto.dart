import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CargaDeFoto extends StatefulWidget {
  @override
  _CargaDeFotoState createState() => _CargaDeFotoState();
}

class _CargaDeFotoState extends State<CargaDeFoto> {
  File? _imagen;

  Future getImage() async {
    final imagen = await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      if (imagen != null) {
        _imagen = File(imagen.path);
      } else {
        print('No se seleccionó ninguna imagen.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carga de Foto'),
      ),
      body: Center(
        child: _imagen == null
            ? Text('No se ha seleccionado ninguna imagen.')
            : Image.file(_imagen!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Selecciona una imagen',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}

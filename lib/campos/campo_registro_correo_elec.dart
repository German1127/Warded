import 'package:flutter/material.dart';

class CampoRegistroNombre extends StatelessWidget {
  final String labelText;

  const CampoRegistroNombre({Key? key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: labelText,
        hintStyle: TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.green,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}

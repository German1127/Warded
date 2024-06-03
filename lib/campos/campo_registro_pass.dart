import 'package:flutter/material.dart';

class CampoRegistroPass extends StatelessWidget {
  final String labelText;

  const CampoRegistroPass({Key? key, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
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
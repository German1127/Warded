import 'package:flutter/material.dart';

class CampoPass extends StatefulWidget {
  const CampoPass({super.key});

  @override
  CampoPassState createState() => CampoPassState();
}

class CampoPassState extends State<CampoPass> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Contraseña',
        labelStyle: const TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.green,
        border: const OutlineInputBorder(),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }
}
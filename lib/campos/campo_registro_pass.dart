import 'package:flutter/material.dart';

class CampoRegistroPass extends StatefulWidget {
  final String labelText;

  const CampoRegistroPass({Key? key, required this.labelText})
      : super(key: key);

  @override
  _CampoRegistroPassState createState() => _CampoRegistroPassState();
}

class _CampoRegistroPassState extends State<CampoRegistroPass> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: 'Contraseña',
        hintStyle: TextStyle(color: Colors.black),
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

import 'package:flutter/material.dart';

class CampoRegistroConfirmarPass extends StatefulWidget {
  final String labelText;

  const CampoRegistroConfirmarPass({Key? key, required this.labelText})
      : super(key: key);

  @override
  _CampoRegistroConfirmarPassState createState() =>
      _CampoRegistroConfirmarPassState();
}

class _CampoRegistroConfirmarPassState
    extends State<CampoRegistroConfirmarPass> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black),
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: widget.labelText,
        hintStyle: TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.green,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
        suffixIcon: IconButton(
          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
          color: Colors.black,
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

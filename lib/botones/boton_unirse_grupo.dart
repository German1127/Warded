import 'package:flutter/material.dart';
import 'package:barcode_scan2/barcode_scan2.dart';

class BotonUnirseGrupo extends StatelessWidget {
  final String text;

  const BotonUnirseGrupo({super.key, required this.text});

  Future<void> scanQR() async {
    try {
      ScanResult qrResult = await BarcodeScanner.scan();
      print(qrResult.rawContent);
    } catch (ex) {
      print(ex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        scanQR();
      },
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(Colors.black),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.green,
        ),
      ),
    );
  }
}

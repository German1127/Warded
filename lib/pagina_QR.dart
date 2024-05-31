import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaginaQR extends StatefulWidget {
  const PaginaQR({super.key});

  @override
  _PaginaQRState createState() => _PaginaQRState();
}

class _PaginaQRState extends State<PaginaQR> {
  String qrData = 'string de prueba';

  @override
  void initState() {
    super.initState();
    qrData = DateTime.now().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agregar usuarios',
          style: TextStyle(
            color: Colors.green,
          ),
        ),
        backgroundColor: Colors.black,
        actions: const <Widget>[
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Fondo.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              color: Colors.white,
              child: QrImageView(
                data: qrData,
                version: QrVersions.auto,
                size: 320.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

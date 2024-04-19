import 'package:flutter/material.dart';

class PBase extends StatefulWidget {
  const PBase({Key? key}) : super(key: key);

  @override
  _PBaseState createState() => _PBaseState();
}

class _PBaseState extends State<PBase> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              // Logo
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              // User
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              // Password
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              // iniciar sesion
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              // crear cuenta
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PBase(),
  ));
}

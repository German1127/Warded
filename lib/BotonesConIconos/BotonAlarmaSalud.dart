import 'package:flutter/material.dart';

class BotonAlarmaSalud extends StatefulWidget {
  @override
  _BotonAlarmaSaludDestello createState() => _BotonAlarmaSaludDestello();
}

class _BotonAlarmaSaludDestello extends State<BotonAlarmaSalud> with SingleTickerProviderStateMixin {
  bool _isRed = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), _changeColor);
  }

  void _changeColor() {
    setState(() {
      _isRed = !_isRed;
    });
    Future.delayed(Duration(seconds: 1), _changeColor);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('¡Aca pongan lo que quieran que haga el boton SIN EL PRINT!');
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        width: 50.0,
        height: 50.0,
        padding: const EdgeInsets.all(0.5),
        decoration: BoxDecoration(
          color: _isRed ? Colors.green : Colors.black,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
            bottomLeft: Radius.circular(50.0),
            bottomRight: Radius.circular(50.0),
          ),
        ),
        child: Image.asset(
          'assets/BotonAlarmaSalud.png',
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}

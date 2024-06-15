import 'package:flutter/material.dart';
import 'package:Warded/funciones_notificacion.dart';

class BotonAlarmaSalud extends StatefulWidget {
  const BotonAlarmaSalud({super.key});

  @override
  _BotonAlarmaSaludDestello createState() => _BotonAlarmaSaludDestello();
}

class _BotonAlarmaSaludDestello extends State<BotonAlarmaSalud> with SingleTickerProviderStateMixin {
  bool _isRed = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), _changeColor);
  }

  void _changeColor() {
    setState(() {
      _isRed = !_isRed;
    });
    Future.delayed(const Duration(seconds: 1), _changeColor);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Future.delayed(const Duration(seconds: 2), () {
          {showNotificationAlarmHealth();}
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
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

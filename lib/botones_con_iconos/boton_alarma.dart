import 'package:flutter/material.dart';
import 'notification_service.dart';

class BotonAlarma extends StatefulWidget {
  @override
  _BotonAlarmaDestello createState() => _BotonAlarmaDestello();
}

class _BotonAlarmaDestello extends State<BotonAlarma> with SingleTickerProviderStateMixin {
  bool _isRed = true;
  final NotificationService _notificationService = NotificationService();

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
      onLongPress: () {
        Future.delayed(Duration(seconds: 2), () async {
          print('¡Se manda luego de mantenerlo 2 segundos!');
          await _notificationService.sendNotification('Mensaje de emergencia');
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        width: 50.0,
        height: 50.0,
        padding: const EdgeInsets.all(0.5),
        decoration: BoxDecoration(
          color: _isRed ? Colors.red : Colors.black,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0),
            bottomLeft: Radius.circular(50.0),
            bottomRight: Radius.circular(50.0),
          ),
        ),
        child: Image.asset(
          'assets/BotonAlarma.png',
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:Warded/terminos_condiciones.dart';
import 'botones_con_iconos/boton_alarma.dart';
import 'botones_con_iconos/boton_alarma_salud.dart';
import 'botones_con_iconos/boton_accidente.dart';
import 'botones_con_iconos/boton_animal_abandonado.dart';
import 'botones_con_iconos/boton_bache.dart';
import 'botones_con_iconos/boton_calle_cerrada.dart';
import 'botones_con_iconos/boton_control_policial.dart';
import 'botones_con_iconos/boton_grupo.dart';
import 'botones_con_iconos/boton_mapa.dart';
import 'botones_con_iconos/boton_sospechoso.dart';
import 'botones_con_iconos/boton_trafico.dart';
import 'package:Warded/login.dart';
import 'funciones_notificacion.dart';
import 'package:Warded/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Warded',
          style: TextStyle(
            color: Colors.green,
          ),
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.description),
            color: Colors.green,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TerminosCondiciones()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.green,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Fondo.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: AppBar().preferredSize.height,
            left: 0,
            right: 0,
            child: Container(
              height: 90.0,
              color: Colors.black.withOpacity(1.0),
              margin: const EdgeInsets.only(top: 5.0, left: 0.0, right: 0.0),
              padding: const EdgeInsets.all(0.100),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: BotonAlarma(),
                    ),
                  ),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: BotonAlarmaSalud(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            top: AppBar().preferredSize.height + 100.0 + 5.0,
            child: Container(
              margin: const EdgeInsets.only(top: 5.0, left: 20.0, right: 20.0),
              padding: const EdgeInsets.all(0.100),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(child: FittedBox(fit: BoxFit.scaleDown, child: BotonSospechoso())),
                      Expanded(child: FittedBox(fit: BoxFit.scaleDown, child: BotonAccidente())),
                      Expanded(child: FittedBox(fit: BoxFit.scaleDown, child: BotonControlPolicial())),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(child: FittedBox(fit: BoxFit.scaleDown, child: BotonCalleCerrada())),
                      Expanded(child: FittedBox(fit: BoxFit.scaleDown, child: BotonTrafico())),
                      Expanded(child: FittedBox(fit: BoxFit.scaleDown, child: BotonBache())),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(child: FittedBox(fit: BoxFit.scaleDown, child: BotonAnimalAbandonado())),
                      Expanded(child: FittedBox(fit: BoxFit.scaleDown, child: BotonGrupo())),
                      Expanded(child: FittedBox(fit: BoxFit.scaleDown, child: BotonMapa())),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

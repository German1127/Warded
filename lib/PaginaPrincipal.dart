import 'package:flutter/material.dart';
import 'BotonesConIconos/BotonAlarma.dart';
import 'BotonesConIconos/BotonAlarmaSalud.dart';
import 'BotonesConIconos/BotonAccidente.dart';
import 'BotonesConIconos/BotonAnimalAbandonado.dart';
import 'BotonesConIconos/BotonBache.dart';
import 'BotonesConIconos/BotonCalleCerrada.dart';
import 'BotonesConIconos/BotonControlPolicial.dart';
import 'BotonesConIconos/BotonGrupo.dart';
import 'BotonesConIconos/BotonMapa.dart';
import 'BotonesConIconos/BotonSospechoso.dart';
import 'BotonesConIconos/BotonTrafico.dart';

void main() {
  runApp(PaginaPrincipal());
}

class PaginaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pagina principal',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Warded',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
          backgroundColor: Colors.black,
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
                height: 110.0,
                color: Colors.black.withOpacity(1.0),
                margin: const EdgeInsets.only(top: 5.0, left: 0.0, right: 0.0),
                padding: const EdgeInsets.all(0.100),
                child: Row(
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
                child: Column(
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'Botones/BotonCasita.dart';

void main() {
  runApp(TerminosCondiciones());
}

class TerminosCondiciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Terminos y condiciones',
      home: Container(
        color: Colors.black,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: const Text(
              'Politicas de privacidad',
              style: TextStyle(
                color: Colors.green,
              ),
            ),
            backgroundColor: Colors.black,
            actions: <Widget>[
              const BotonCasita(text: 'Inicio'),
            ],
          ),
          body: Column(
            children: <Widget>[
              Container(
                color: Colors.black,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Como utilizamos sus datos',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints viewportConstraints) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 20.0),
                              Text(
                                'Términos y Condiciones:\n'
                                    'Los datos personales de los usuarios, como nombres, direcciones, números de teléfono,'
                                    ' y cualquier otra información sensible, deben ser recopilados y almacenados de manera segura,'
                                    ' cumpliendo con las regulaciones de privacidad de datos correspondientes (por ejemplo, GDPR en Europa, CCPA en California, etc.)'
                                    '.Se debe obtener el consentimiento explícito de los usuarios antes de recopilar cualquier dato personal.'
                                    'Los usuarios deben tener la opción de eliminar sus datos en cualquier momento y retirar su consentimiento para el procesamiento de datos.\n \n'
                                    'Seguridad de los Datos:\n'
                                    'Los datos de la aplicación, incluidos los marcadores en el mapa,'
                                    'deben ser almacenados en servidores seguros con medidas de seguridad robustas,'
                                    'como cifrado de extremo a extremo y protocolos de autenticación sólidos'
                                    'Se deben implementar medidas de seguridad contra accesos no autorizados,'
                                    'como firewalls, sistemas de detección de intrusiones,'
                                    'y monitoreo continuo de actividad sospechosSe debe realizar una copia de seguridad regular'
                                    'de los datos para evitar la pérdida de información en caso de fallos del sistema o ataques cibernéticos.\n'
                                    '\nUso Ético de los Datos:\n'
                                    'Los marcadores en el mapa deben ser utilizados únicamente con fines de mejorar la comunidad vecinal. No se debe permitir el acoso,'
                                    'la discriminación o la difamación de ninguna persona.'
                                    'Se deben establecer políticas claras sobre qué comportamientos constituyen sospechosos y cómo deben manejarse estos datos de manera ética y legal.',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

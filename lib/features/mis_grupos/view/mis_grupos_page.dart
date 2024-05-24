import 'package:flutter/material.dart';
import 'package:untitle/features/mis_grupos/models/vecino.dart';
import 'package:untitle/features/mis_grupos/view/widgets/mis_grupos_item.dart';
import 'package:untitle/Botones/BotonCasita.dart';
import 'package:untitle/Botones/BotonUnirseGrupo.dart';
import 'package:untitle/Botones/BotonAbandonarGrupo.dart';

class MisGruposPage extends StatelessWidget {
  const MisGruposPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Vecino> vecinos = [
      Vecino(1, 'Grupo A', 'Rafael Nadal', 'Admin', 'photoUrl'),
      Vecino(2, 'Grupo A', 'Roger Federer', 'Admin', 'photoUrl'),
      Vecino(3, 'Grupo A', 'Novak Djokovic', 'Admin', 'photoUrl'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tu grupo',
          style: TextStyle(
            color: Colors.green,
          ),
        ),
        backgroundColor: Colors.black,
        actions: const <Widget>[
          BotonCasita(text: 'Inicio'),
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
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/IconoUsuario.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),
                    const BotonUnirseGrupo(text: 'Unirse'),
                  ],
                ),
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Integrantes',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) => MisGruposItem(
                          vecino: vecinos[index],
                        ),
                        itemCount: vecinos.length,
                      ),
                    ),
                    BotonAbandonarGrupo(text: 'Abandonar',),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

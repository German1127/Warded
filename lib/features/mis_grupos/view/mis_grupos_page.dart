import 'package:flutter/material.dart';
import 'package:untitle/features/mis_grupos/models/vecino.dart';
import 'package:untitle/features/mis_grupos/view/widgets/mis_grupos_item.dart';

class MisGruposPage extends StatelessWidget {
  const MisGruposPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get data from cubit
    final List<Vecino> vecinos = [
      Vecino(1, 'Grupo A', 'Rafael Nadal', 'Admin', 'photoUrl'),
      Vecino(2, 'Grupo A', 'Roger Federer', 'Admin', 'photoUrl'),
      Vecino(3, 'Grupo A', 'Novak Djokovic', 'Admin', 'photoUrl'),
    ];

    // Build the page
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Mis Grupos'),
      // ),
      // TODO: Header (Foto del usuario , nombre del usuario, etc)
      body: ListView.builder(
        itemBuilder: (context, index) => MisGruposItem(
          vecino: vecinos[index],
        ),
        itemCount: vecinos.length,
      ),
      // TODO: Botones de Volver a Home y Unirse
    );
  }
}

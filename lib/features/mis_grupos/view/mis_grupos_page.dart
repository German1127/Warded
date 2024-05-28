import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitle/features/mis_grupos/cubic/mis_grupos_cubit.dart';
import 'package:untitle/features/mis_grupos/models/vecino.dart';
import 'package:untitle/features/mis_grupos/view/widgets/mis_grupos_item.dart';
import 'package:untitle/Botones/boton_casita.dart';
import 'package:untitle/Botones/boton_unirse_grupo.dart';
import 'package:untitle/Botones/boton_abandonar_grupo.dart';
import 'package:untitle/Botones/boton_invitar_grupo.dart';

class MisGruposPage extends StatelessWidget {
  const MisGruposPage({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<MisGruposCubit, MisGruposState>(builder: (context, state){
      final vecinos = state.vecinos;
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Tu grupo',
            style: TextStyle(
              color: Colors.green,
            ),
          ),
          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(onPressed: context.read<MisGruposCubit>().getVecinos, icon: Icon(Icons.refresh)),
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
            (state.loading)
            ? CircularProgressIndicator():
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          BotonAbandonarGrupo(text: 'Abandonar',),
                          BotonInvitarGrupo(text: 'Invitar',),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

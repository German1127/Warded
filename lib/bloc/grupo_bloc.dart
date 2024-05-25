import 'package:flutter/material.dart';
import 'package:untitle/features/mis_grupos/models/vecino.dart';
import 'package:untitle/bloc/estado_bloc.dart';
import 'package:untitle/bloc/eventos_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MisGruposItem extends StatelessWidget {
  final Vecino vecino;

  MisGruposItem({required this.vecino});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(vecino.nombre),
    );
  }
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<GrupoBloc, GrupoEstado>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text('Tu grupo')),
            body: ListView.builder(
              itemCount: state.usuarios.length,
              itemBuilder: (context, index) {
                return MisGruposItem(vecino: state.usuarios[index]);
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                var nuevoUsuario = Vecino(
                  null,
                  null,
                  'Carlitos',
                  'Usuario',
                  null,
                );
                context.read<GrupoBloc>().add(AgregarUsuario(nuevoUsuario));
              },
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}

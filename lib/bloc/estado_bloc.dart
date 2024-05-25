import 'package:bloc/bloc.dart';
import 'package:untitle/features/mis_grupos/models/vecino.dart';
import 'package:untitle/bloc/eventos_bloc.dart';


abstract class GrupoEvento {
  const GrupoEvento();
}

class AgregarUsuario extends GrupoEvento {
  final Vecino nuevoUsuario;

  const AgregarUsuario(this.nuevoUsuario);
}

class GrupoBloc extends Bloc<GrupoEvento, GrupoEstado> {
  GrupoBloc() : super(GrupoEstado([]));

  @override
  Stream<GrupoEstado> mapEventToState(GrupoEvento event) async* {
    if (event is AgregarUsuario) {
      var nuevosUsuarios = List<Vecino>.from(state.usuarios)..add(event.nuevoUsuario);
      yield GrupoEstado(nuevosUsuarios);
    }
  }
}

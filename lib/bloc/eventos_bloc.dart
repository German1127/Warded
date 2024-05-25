import 'package:untitle/features/mis_grupos/models/vecino.dart';

enum GrupoEvento { agregarUsuario }

class GrupoEstado {
  final List<Vecino> usuarios;
  GrupoEstado(this.usuarios);
}

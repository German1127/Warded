import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:untitle/features/mis_grupos/models/vecino.dart';
import 'package:untitle/features/mis_grupos/view/mis_grupos_loading.dart';

part 'mis_grupos_state.dart';

class MisGruposCubit extends Cubit<MisGruposState> {
  MisGruposCubit() : super(MisGruposState());

// traer listados de usuarios
  Future<void> getVecinos() async {
    // emitir loading
    emit(state.copyWith(loading: true));
    await Future.delayed(Duration(seconds: 3));
    // base datos
    final List<Vecino> vecinosList = [
      Vecino(1, 'Grupo A', 'Rafael Nadal', 'Admin', 'photoUrl'),
      Vecino(2, 'Grupo A', 'Roger Federer', 'Admin', 'photoUrl'),
      Vecino(3, 'Grupo A', 'Novak Djokovic', 'Admin', 'photoUrl'),
    ];
    emit(state.copyWith(
      loading: false,
      vecinos: vecinosList,
    ));
  }
// abndonar el grupo
}

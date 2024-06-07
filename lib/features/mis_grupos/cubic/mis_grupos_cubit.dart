import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitle/features/mis_grupos/models/vecino.dart';

part 'mis_grupos_state.dart';

class MisGruposCubit extends Cubit<MisGruposState> {
  MisGruposCubit() : super(const MisGruposState());

  // traer listados de usuarios
  Future<void> getVecinos() async {
    try {
      // emitir loading
      emit(state.copyWith(loadingScreen: true));
      await Future.delayed(const Duration(seconds: 3));
      // base datos
      final List<Vecino> vecinosList = [
       // Vecino('1', 'Grupo A', 'Rafael Nadal', 'Admin', 'photoUrl'),
       // Vecino('2', 'Grupo A', 'Roger Federer', 'Admin', 'photoUrl'),
       // Vecino('3', 'Grupo A', 'Novak Djokovic', 'Admin', 'photoUrl'),
        await Vecino.fromFirestore('1'),
        await Vecino.fromFirestore('2'),
        await Vecino.fromFirestore('3'),

      ];

      // vecinosList[2].toFirestore();

      emit(state.copyWith(
        loadingScreen: false,
        vecinos: vecinosList,
      ));
    } catch (e) {
      // emitir error
      emit(state.copyWith(error: e.toString()));
    }
  }

  // sacar gente del grupo
  Future<void> abandonarGrupo(int vecinoId) async {
    // emitir loading
    emit(state.copyWith(loadingScreen: true));
    await Future.delayed(const Duration(seconds: 2));

    // mira la lista de vecinos para sacar al vecino que se va
    final List<Vecino> ActualizarVecinosList = state.vecinos.where((vecino) => vecino.id != vecinoId).toList();

    emit(state.copyWith(
      loadingScreen: false,
      vecinos: ActualizarVecinosList,
    ));
  }

  // generar un error
  Future<void> generarError() async {
    emit(state.copyWith(loadingScreen: true));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(error: 'Este es un error de prueba'));
  }
}


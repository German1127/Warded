import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:untitle/features/mis_grupos/models/vecino.dart';

import '../../../main.dart';
import '../models/grupo.dart';

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

      final List<Vecino> vecinosList = await currentGroup.getMembers();

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
  Future<void> abandonarGrupo() async {
    // emitir loading
    emit(state.copyWith(loadingScreen: true));
    await Future.delayed(const Duration(seconds: 2));

    // mira la lista de vecinos para sacar al vecino que se va
    //final List<Vecino> ActualizarVecinosList = state.vecinos.where((vecino) => vecino.id != vecinoId).toList();

    await currentGroup.removeMember(currentUser);
    currentGroup = Grupo("",[]);
    await currentGroup.toFirestore();
    currentUser.groupId = currentGroup.id;
    currentUser.toFirestore();
    await currentGroup.addMember(currentUser);
    final List<Vecino> ActualizarVecinosList = await currentGroup.getMembers();

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


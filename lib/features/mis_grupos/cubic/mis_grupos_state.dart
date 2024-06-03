part of 'mis_grupos_cubit.dart';

class MisGruposState extends Equatable {
  final bool loading;
  final bool loadingScreen;
  final bool? idPhoto;
  final String? urlPhoto;
  final String? error;
  final List<Vecino> vecinos;

  const MisGruposState({
    this.loading = false,
    this.loadingScreen = false,
    this.error,
    this.vecinos = const [],
    this.idPhoto,
    this.urlPhoto,
  });

  @override
  List<Object?> get props => [loading, loadingScreen, error, vecinos, idPhoto];

  MisGruposState copyWith({
    bool? loading,
    bool? loadingScreen,
    bool? idPhoto,
    String? urlPhoto,
    String? error,
    List<Vecino>? vecinos,
  }) {
    return MisGruposState(
      loading: loading ?? this.loading,
      loadingScreen: loadingScreen ?? this.loadingScreen,
      error: error ?? this.error,
      vecinos: vecinos ?? this.vecinos,
      idPhoto: idPhoto ?? this.idPhoto,
      urlPhoto: urlPhoto ?? this.urlPhoto,
    );
  }
}

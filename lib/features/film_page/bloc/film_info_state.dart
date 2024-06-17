part of 'film_info_bloc.dart';

abstract class FilmInfoState extends Equatable {}

class FilmInfoInitial extends FilmInfoState {
  @override
  List<Object?> get props => [];
}

class FilmInfoLoaded extends FilmInfoState {
  FilmInfoLoaded({required this.filmsImagesList, required this.filmInfoList});

  final List<FilmInfo> filmInfoList;
  final List<FilmImages> filmsImagesList;
  @override
  List<Object?> get props => [filmInfoList, filmsImagesList];
}

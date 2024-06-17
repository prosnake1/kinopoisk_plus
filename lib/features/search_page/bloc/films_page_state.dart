part of 'films_page_bloc.dart';

abstract class FilmsPageState extends Equatable {}

class FilmsPageInitial extends FilmsPageState {
  @override
  List<Object?> get props => [];
}

class FilmsPageLoading extends FilmsPageState {
  @override
  List<Object?> get props => [];
}

class FilmsPageLoaded extends FilmsPageState {
  FilmsPageLoaded({required this.pageFilmList, required this.page});
  final List<DataFilm> pageFilmList;
  final int page;

  @override
  List<Object?> get props => [pageFilmList];
}

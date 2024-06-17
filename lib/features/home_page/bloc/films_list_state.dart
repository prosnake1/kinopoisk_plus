part of 'films_list_bloc.dart';

class FilmsListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FilmsListInitial extends FilmsListState {
  @override
  List<Object?> get props => [];
}

class FilmsListLoading extends FilmsListState {
  @override
  List<Object?> get props => [];
}

class FilmsListLoaded extends FilmsListState {
  FilmsListLoaded({required this.topFilmsList});
  final List<TopFilms> topFilmsList;
  @override
  List<Object?> get props => [topFilmsList];
}

class FilmsListLoadingFailure extends FilmsListState {
  FilmsListLoadingFailure({this.exception});
  final Object? exception;
  @override
  List<Object?> get props => [exception];
}

part of 'films_list_bloc.dart';

abstract class FilmsListEvent extends Equatable {}

class LoadFilmsList extends FilmsListEvent {
  LoadFilmsList({this.completer});
  final Completer? completer;
  @override
  List<Object?> get props => [completer];
}

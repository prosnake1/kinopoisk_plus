part of 'films_page_bloc.dart';

abstract class FilmsPageEvent extends Equatable {}

class SearchFilmsEvent extends FilmsPageEvent {
  SearchFilmsEvent(this.keyword, this.page);
  final String keyword;
  final int page;

  @override
  List<Object?> get props => [keyword, page];
}

class LoadFilmsEvent extends FilmsPageEvent {
  @override
  List<Object?> get props => [];
}

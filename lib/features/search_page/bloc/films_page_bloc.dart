import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kinopoisk_plus/repositories/films_list/films_list_repository.dart';
import 'package:kinopoisk_plus/repositories/films_list/models/datafilm.dart';
part 'films_page_state.dart';
part 'films_page_event.dart';

class FilmsPageBloc extends Bloc<FilmsPageEvent, FilmsPageState> {
  FilmsPageBloc(this._filmsListRepository) : super(FilmsPageInitial()) {
    on<SearchFilmsEvent>(_onSearch);
  }

  Future<void> _onSearch(
      SearchFilmsEvent event, Emitter<FilmsPageState> emit) async {
    final result = await _filmsListRepository.getFilmsList(event.keyword,
        page: event.page);
    emit(FilmsPageLoaded(pageFilmList: result, page: event.page));
  }

  final FilmsListRepository _filmsListRepository;
}

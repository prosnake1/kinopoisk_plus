import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kinopoisk_plus/repositories/repository.dart';

part 'films_list_event.dart';
part 'films_list_state.dart';

class FilmsListBloc extends Bloc<FilmsListEvent, FilmsListState> {
  FilmsListBloc(this.topFilmsRepository) : super(FilmsListInitial()) {
    on<LoadFilmsList>((event, emit) async {
      try {
        final topFilmsList = await topFilmsRepository.getTopFilmsList();
        emit(FilmsListLoaded(topFilmsList: topFilmsList));
      } catch (e) {
        emit(FilmsListLoadingFailure(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
  }

  final TopFilmsRepository topFilmsRepository;
}

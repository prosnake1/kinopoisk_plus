import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kinopoisk_plus/repositories/film_images/film_images_repository.dart';
import 'package:kinopoisk_plus/repositories/film_images/models/filmimages.dart';
import 'package:kinopoisk_plus/repositories/film_info/film_info_repository.dart';
import 'package:kinopoisk_plus/repositories/film_info/models/filminfo.dart';
part 'film_info_event.dart';
part 'film_info_state.dart';

class FilmInfoBloc extends Bloc<FilmInfoEvent, FilmInfoState> {
  FilmInfoBloc(this._filmInfoRepository, this._filmImagesRepository)
      : super(FilmInfoInitial()) {
    on<LoadFilmInfo>(_onLoadInfo);
  }
  Future<void> _onLoadInfo(
      LoadFilmInfo event, Emitter<FilmInfoState> emit) async {
    final images = await _filmImagesRepository.getFilmImages(event.id);
    final result = await _filmInfoRepository.getDataItems(event.id);
    emit(FilmInfoLoaded(filmInfoList: result, filmsImagesList: images));
  }

  final FilmInfoRepository _filmInfoRepository;
  final FilmImagesRepository _filmImagesRepository;
}

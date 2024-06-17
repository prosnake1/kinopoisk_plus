import 'package:dio/dio.dart';
import 'package:kinopoisk_plus/repositories/films_list/models/datafilm.dart';
import 'package:kinopoisk_plus/repositories/films_list/models/filmslist.dart';

class FilmsListRepository {
  FilmsListRepository(this.word, this.page);
  final String word;
  final int page;
  Future<List<DataFilm>> getFilmsList(word, {page}) async {
    try {
      const key = 'cc8b4852-3a5c-441c-82e3-f67e5eb33fea';
      final response = await Dio().get(
          'https://kinopoiskapiunofficial.tech/api/v2.1/films/search-by-keyword?keyword=${word ?? ''}&page=${page ?? 1}',
          options: Options(headers: {"X-API-KEY": key}));
      if (response.statusCode == 200) {
        final data = response.data;
        final films =
            (data['films'] as List).map((e) => FilmsList.fromJson(e)).toList();
        List<DataFilm> result = [
          DataFilm(
              keyword: data['keyword'],
              pagesCount: data['pagesCount'],
              searchFilmsCountResult: data['searchFilmsCountResult'],
              films: films)
        ];
        return result;
      } else {
        throw Exception();
      }
    } on Object catch (e, stack) {
      Error.throwWithStackTrace(e, stack);
    }
  }
}

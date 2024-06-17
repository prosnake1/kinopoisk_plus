import 'package:dio/dio.dart';
import 'package:kinopoisk_plus/repositories/top_10_popular_films/models/topfilms.dart';

class TopFilmsRepository {
  final apiKey = 'cc8b4852-3a5c-441c-82e3-f67e5eb33fea';
  List<TopFilms> topFilms = [];
  Future<List<TopFilms>> getTopFilmsList() async {
    try {
      final response = await Dio().get(
          'https://kinopoiskapiunofficial.tech/api/v2.2/films/collections?type=TOP_POPULAR_MOVIES&page=1',
          options: Options(headers: {"X-API-KEY": apiKey}));
      if (response.statusCode == 200) {
        final data = response.data;
        final items = data['items'];
        final result =
            (items as List).map((e) => TopFilms.fromJson(e)).toList();
        for (int i = 0; i < 10; i++) {
          topFilms.add(result[i]);
        }
        return topFilms;
      } else {
        throw Exception();
      }
    } on Object catch (e, stack) {
      Error.throwWithStackTrace(e, stack);
    }
  }
}

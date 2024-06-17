import 'package:dio/dio.dart';
import 'package:kinopoisk_plus/repositories/film_info/models/filminfo.dart';

class FilmInfoRepository {
  FilmInfoRepository(this.id);
  final int id;
  Future<List<FilmInfo>> getDataItems(id) async {
    try {
      const key = 'cc8b4852-3a5c-441c-82e3-f67e5eb33fea';
      final response = await Dio().get(
          'https://kinopoiskapiunofficial.tech/api/v2.2/films/$id',
          options: Options(headers: {'X-API-KEY': key}));
      if (response.statusCode == 200) {
        final data = response.data;
        List countriesData = data['countries'];
        final countries = countriesData.map((e) => e['country']).toList();
        List genresData = data['genres'];
        final genres = genresData.map((e) => e['genre']).toList();
        List<FilmInfo> result = [
          FilmInfo(
              nameRu: data['nameRu'].toString(),
              nameOriginal: data['nameOriginal'].toString(),
              posterUrl: data['posterUrl'].toString(),
              ratingKinopoisk: data['ratingKinopoisk'],
              countries: countries,
              genres: genres,
              year: data['year'].toString(),
              description: data['description'],
              coverUrl: data['coverUrl'])
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

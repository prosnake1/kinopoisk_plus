import 'package:dio/dio.dart';
import 'package:kinopoisk_plus/repositories/film_images/models/filmimages.dart';

class FilmImagesRepository {
  FilmImagesRepository(this.id);
  final int id;
  Future<List<FilmImages>> getFilmImages(id) async {
    try {
      const key = 'cc8b4852-3a5c-441c-82e3-f67e5eb33fea';
      Options options = Options(
        headers: {'X-API-KEY': key},
      );
      final response = await Dio().get(
          'https://kinopoiskapiunofficial.tech/api/v2.2/films/${id.toString()}/images?type=STILL&page=1',
          options: options);
      if (response.statusCode == 200) {
        final data = response.data;
        final items = data['items'];
        final result =
            (items as List).map((e) => FilmImages.fromJson(e)).toList();
        return result;
      } else {
        throw Exception();
      }
    } on Object catch (e, stack) {
      Error.throwWithStackTrace(e, stack);
    }
  }
}

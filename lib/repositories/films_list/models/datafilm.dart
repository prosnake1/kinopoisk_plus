import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:kinopoisk_plus/repositories/films_list/models/filmslist.dart';

part 'datafilm.g.dart';

@JsonSerializable()
class DataFilm extends Equatable {
  const DataFilm(
      {required this.keyword,
      required this.pagesCount,
      required this.searchFilmsCountResult,
      required this.films});
  final String keyword;
  final int pagesCount;
  final int searchFilmsCountResult;
  final List<FilmsList> films;

  factory DataFilm.fromJson(Map<String, dynamic> json) =>
      _$DataFilmFromJson(json);
  Map<String, dynamic> toJson() => _$DataFilmToJson(this);

  @override
  List<Object?> get props =>
      [keyword, pagesCount, searchFilmsCountResult, films];
}

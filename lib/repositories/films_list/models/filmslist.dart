import 'package:json_annotation/json_annotation.dart';

part 'filmslist.g.dart';

@JsonSerializable()
class FilmsList {
  FilmsList(
      {this.nameRu,
      required this.year,
      required this.posterUrl,
      this.nameEn,
      required this.filmId});
  final String? nameRu;
  final String year;
  final String? nameEn;
  final String posterUrl;
  final int filmId;

  factory FilmsList.fromJson(Map<String, dynamic> json) =>
      _$FilmsListFromJson(json);

  Map<String, dynamic> toJson() => _$FilmsListToJson(this);
}

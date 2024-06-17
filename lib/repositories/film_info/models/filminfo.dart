import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filminfo.g.dart';

@JsonSerializable()
class FilmInfo extends Equatable {
  const FilmInfo(
      {this.nameRu,
      required this.nameOriginal,
      required this.posterUrl,
      required this.ratingKinopoisk,
      required this.countries,
      required this.genres,
      required this.year,
      required this.description,
      required this.coverUrl});
  final String? nameRu;
  final String nameOriginal;
  final String posterUrl;
  final double? ratingKinopoisk;
  final String year;
  final List countries;
  final List genres;
  final String? description;
  final String? coverUrl;

  factory FilmInfo.fromJson(Map<String, dynamic> json) =>
      _$FilmInfoFromJson(json);
  Map<String, dynamic> toJson() => _$FilmInfoToJson(this);

  @override
  List<Object?> get props => [
        nameRu,
        nameOriginal,
        posterUrl,
        ratingKinopoisk,
        countries,
        genres,
        year,
        description,
        coverUrl
      ];
}

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'topfilms.g.dart';

@JsonSerializable()
class TopFilms extends Equatable {
  const TopFilms(
      {required this.nameRu,
      required this.year,
      required this.posterUrl,
      required this.kinopoiskId});
  final String nameRu;
  final int year;
  final String posterUrl;
  final int kinopoiskId;

  factory TopFilms.fromJson(Map<String, dynamic> json) =>
      _$TopFilmsFromJson(json);

  Map<String, dynamic> toJson() => _$TopFilmsToJson(this);

  @override
  List<Object?> get props => [nameRu, year, posterUrl, kinopoiskId];
}

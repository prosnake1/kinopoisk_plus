// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filminfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmInfo _$FilmInfoFromJson(Map<String, dynamic> json) => FilmInfo(
    nameRu: json['nameRu'] as String?,
    nameOriginal: json['nameOriginal'] as String,
    posterUrl: json['posterUrl'] as String,
    ratingKinopoisk: (json['ratingKinopoisk'] as num?)?.toDouble(),
    countries: json['countries'] as List<dynamic>,
    genres: json['genres'] as List<dynamic>,
    year: json['year'] as String,
    description: json['description'] as String?,
    coverUrl: json['coverUrl'] as String?);

Map<String, dynamic> _$FilmInfoToJson(FilmInfo instance) => <String, dynamic>{
      'nameRu': instance.nameRu,
      'nameOriginal': instance.nameOriginal,
      'posterUrl': instance.posterUrl,
      'ratingKinopoisk': instance.ratingKinopoisk,
      'year': instance.year,
      'countries': instance.countries,
      'genres': instance.genres,
      'description': instance.description,
      'coverUrl': instance.coverUrl
    };

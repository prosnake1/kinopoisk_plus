// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topfilms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopFilms _$TopFilmsFromJson(Map<String, dynamic> json) => TopFilms(
    nameRu: json['nameRu'] as String,
    year: (json['year'] as num).toInt(),
    posterUrl: json['posterUrl'] as String,
    kinopoiskId: json['kinopoiskId'] as int);

Map<String, dynamic> _$TopFilmsToJson(TopFilms instance) => <String, dynamic>{
      'nameRu': instance.nameRu,
      'year': instance.year,
      'posterUrl': instance.posterUrl,
      'kinopoiskId': instance.kinopoiskId
    };

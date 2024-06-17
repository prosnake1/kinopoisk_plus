// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filmslist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmsList _$FilmsListFromJson(Map<String, dynamic> json) => FilmsList(
      nameRu: json['nameRu'] as String?,
      year: json['year'] as String,
      posterUrl: json['posterUrl'] as String,
      nameEn: json['nameEn'] as String?,
      filmId: (json['filmId'] as num).toInt(),
    );

Map<String, dynamic> _$FilmsListToJson(FilmsList instance) => <String, dynamic>{
      'nameRu': instance.nameRu,
      'year': instance.year,
      'nameEn': instance.nameEn,
      'posterUrl': instance.posterUrl,
      'filmId': instance.filmId,
    };

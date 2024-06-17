// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datafilm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataFilm _$DataFilmFromJson(Map<String, dynamic> json) => DataFilm(
      keyword: json['keyword'] as String,
      pagesCount: (json['pagesCount'] as num).toInt(),
      searchFilmsCountResult: (json['searchFilmsCountResult'] as num).toInt(),
      films: (json['films'] as List<dynamic>)
          .map((e) => FilmsList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataFilmToJson(DataFilm instance) => <String, dynamic>{
      'keyword': instance.keyword,
      'pagesCount': instance.pagesCount,
      'searchFilmsCountResult': instance.searchFilmsCountResult,
      'films': instance.films,
    };

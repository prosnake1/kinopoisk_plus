import 'package:flutter/material.dart';
import 'package:kinopoisk_plus/repositories/film_info/models/filminfo.dart';

ListView buildCountriesTiles(FilmInfo infoList) {
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: infoList.countries.length,
    itemBuilder: (context, index) => Text(infoList.countries[index].toString(),
        style: Theme.of(context).textTheme.titleMedium),
  );
}

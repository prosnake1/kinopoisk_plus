import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kinopoisk_plus/repositories/film_images/models/filmimages.dart';

ListView buildImages(List<FilmImages> images) {
  return ListView.separated(
    separatorBuilder: (context, index) => const Padding(
      padding: EdgeInsets.only(right: 10, left: 10),
    ),
    itemCount: images.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      return SizedBox(
        child: CachedNetworkImage(
          imageUrl: images[index].imageUrl,
          height: 200,
        ),
      );
    },
  );
}

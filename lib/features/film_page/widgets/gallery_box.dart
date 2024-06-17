import 'package:flutter/material.dart';
import 'package:kinopoisk_plus/features/film_page/widgets/widgets.dart';
import 'package:kinopoisk_plus/repositories/film_images/models/filmimages.dart';

class GalleryBox extends StatelessWidget {
  const GalleryBox({
    super.key,
    required this.images,
  });

  final List<FilmImages> images;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
              child: Container(
                  height: 200,
                  color: Colors.grey.shade200,
                  width: MediaQuery.sizeOf(context).width,
                  child: buildImages(images))),
        ],
      ),
    );
  }
}

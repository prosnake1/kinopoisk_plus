import 'package:flutter/material.dart';
import 'package:kinopoisk_plus/features/film_page/widgets/widgets.dart';
import 'package:kinopoisk_plus/repositories/film_images/models/filmimages.dart';
import 'package:kinopoisk_plus/repositories/film_info/models/filminfo.dart';

class ScreenWidgets extends StatelessWidget {
  const ScreenWidgets({
    super.key,
    required this.infoList,
    required this.imageUrl,
    required this.images,
  });

  final FilmInfo infoList;
  final String imageUrl;
  final List<FilmImages> images;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ImageWidget(infoList: infoList, imageUrl: imageUrl),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: Colors.white,
              height: 15,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          buildTitle(infoList, context),
          Text(
            infoList.year,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          const SizedBox(
            height: 20,
          ),
          GenresWidget(infoList: infoList),
          (images.isEmpty == true) ? const SizedBox() : const GalleryTitle(),
          (images.isEmpty == true)
              ? const SizedBox()
              : GalleryBox(images: images),
          const SizedBox(
            height: 15,
          ),
          const InformationTitle(),
          DescriptionWidget(infoList: infoList),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

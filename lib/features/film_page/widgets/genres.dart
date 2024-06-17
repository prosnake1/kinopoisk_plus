import 'package:flutter/material.dart';
import 'package:kinopoisk_plus/repositories/film_info/models/filminfo.dart';

class GenresWidget extends StatelessWidget {
  const GenresWidget({
    super.key,
    required this.infoList,
  });

  final FilmInfo infoList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: GridView.builder(
      shrinkWrap: true,
      itemCount: infoList.genres.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, childAspectRatio: 3.0),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Card(
          child: Text(
            infoList.genres[index],
            textAlign: TextAlign.center,
          ),
        );
      },
    ));
  }
}

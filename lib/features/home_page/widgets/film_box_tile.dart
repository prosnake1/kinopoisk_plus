import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kinopoisk_plus/repositories/top_10_popular_films/models/topfilms.dart';

class FilmBoxTile extends StatelessWidget {
  const FilmBoxTile({
    super.key,
    required this.film,
    required this.topPlace,
  });

  final TopFilms film;
  final int topPlace;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 20),
            CachedNetworkImage(
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              imageUrl: film.posterUrl,
              width: 100,
              height: 200,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 240,
                  child: Text(
                    film.nameRu,
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(film.year.toString(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500)),
                Text('${topPlace + 1} место',
                    style: Theme.of(context).textTheme.labelMedium)
              ],
            ),
          ],
        ),
        onTap: () {
          Navigator.of(context)
              .pushNamed('/search/film', arguments: {'id': film.kinopoiskId});
        },
      ),
    );
  }
}

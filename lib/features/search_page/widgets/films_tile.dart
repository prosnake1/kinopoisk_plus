import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kinopoisk_plus/repositories/films_list/models/filmslist.dart';

class FilmTile extends StatelessWidget {
  const FilmTile({
    super.key,
    required this.film,
  });

  final FilmsList film;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: InkWell(
        child: Container(
          color: Colors.grey.shade100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: film.posterUrl,
                width: 100,
                height: 200,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          film.nameRu ?? film.nameEn ?? 'Незивестно',
                          style: Theme.of(context).textTheme.titleMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    film.year,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Navigator.of(context).pushNamed('/search/film',
                  //         arguments: {'id': film.filmId});
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //       backgroundColor: Colors.orange,
                  //       foregroundColor: Colors.white),
                  //   child: const Text(
                  //     'Перейти',
                  //     style: TextStyle(
                  //         color: Colors.black, fontWeight: FontWeight.w500),
                  //   ),
                  // )
                ],
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context)
              .pushNamed('/search/film', arguments: {'id': film.filmId});
        },
      ),
    );
  }
}

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kinopoisk_plus/features/collection_page/models/film_model.dart';
import 'package:kinopoisk_plus/features/collection_page/widgets/widgets.dart';

class FilmListView extends StatelessWidget {
  const FilmListView({
    super.key,
    required this.film,
    required this.filmRef,
  });

  final FilmModel film;
  final DatabaseReference? filmRef;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              film.imageUrl,
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
                SizedBox(
                  width: MediaQuery.of(context).size.width - 170,
                  child: Text(
                    film.name,
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/search/film', arguments: {
                      'id': film.id,
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white),
                  child: const Text(
                    'Перейти',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
                IconButton(
                    alignment: Alignment.topRight,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return ConfirmDelete(filmRef: filmRef, film: film);
                          });
                    },
                    icon: const Icon(
                      Icons.remove_circle,
                      color: Colors.red,
                      size: 40,
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

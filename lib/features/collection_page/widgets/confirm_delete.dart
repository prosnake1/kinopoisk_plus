import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kinopoisk_plus/features/collection_page/models/film_model.dart';

class ConfirmDelete extends StatelessWidget {
  const ConfirmDelete({
    super.key,
    required this.filmRef,
    required this.film,
  });

  final DatabaseReference? filmRef;
  final FilmModel film;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Вы точно хотите удалить фильм?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Нет'),
        ),
        TextButton(
            onPressed: () async {
              if (filmRef != null) {
                await filmRef!.child(film.filmId).remove();
              }
              // ignore: use_build_context_synchronously
              Navigator.of(context).pop();
            },
            child: const Text('Да'))
      ],
    );
  }
}

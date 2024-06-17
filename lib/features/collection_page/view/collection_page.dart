import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kinopoisk_plus/features/collection_page/models/film_model.dart';
import 'package:kinopoisk_plus/features/collection_page/widgets/widgets.dart';

class FilmsCollection extends StatefulWidget {
  const FilmsCollection({super.key});

  @override
  State<FilmsCollection> createState() => _FilmsCollectionState();
}

class _FilmsCollectionState extends State<FilmsCollection> {
  User? user;
  DatabaseReference? filmRef;
  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      filmRef = FirebaseDatabase.instance.ref().child('films').child(user!.uid);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Моя коллекция'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: filmRef?.onValue,
              builder: (context, snapshot) {
                if (snapshot.hasData && !snapshot.hasError) {
                  var event = snapshot.data as DatabaseEvent;
                  var snapshot2 = event.snapshot.value;
                  if (snapshot2 == null) {
                    return const Center(
                      child: Text('Нет добавленных фильмов'),
                    );
                  }
                  var map = Map<String, dynamic>.from(
                      snapshot2 as Map<dynamic, dynamic>);

                  List<FilmModel> films = [];
                  for (var filmMap in map.values) {
                    FilmModel filmModel =
                        FilmModel.fromMap(Map<String, dynamic>.from(filmMap));
                    films.add(filmModel);
                  }
                  return ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: films.length,
                    itemBuilder: (context, index) {
                      FilmModel film = films[index];
                      return FilmListView(film: film, filmRef: filmRef);
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kinopoisk_plus/features/film_page/bloc/film_info_bloc.dart';
import 'package:kinopoisk_plus/features/film_page/widgets/widgets.dart';
import 'package:kinopoisk_plus/repositories/film_images/film_images_repository.dart';
import 'package:kinopoisk_plus/repositories/film_info/film_info_repository.dart';

class FilmInfoPage extends StatefulWidget {
  const FilmInfoPage({super.key});

  @override
  State<FilmInfoPage> createState() => _FilmInfoPageState();
}

class _FilmInfoPageState extends State<FilmInfoPage> {
  int id = 0;
  String addedFilmId = '';
  String filmName = 'Загрузка...';
  bool isAdded = false;
  User? user = FirebaseAuth.instance.currentUser;
  static String imageUrl =
      'https://upload.wikimedia.org/wikipedia/commons/6/65/No-Image-Placeholder.svg';
  final _filmInfoBloc =
      FilmInfoBloc(FilmInfoRepository(0), FilmImagesRepository(0));
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    id = args['id'] as int;
    _filmInfoBloc.add(LoadFilmInfo(id: id));
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  void initState() {
    checkFilm();
    super.initState();
  }

  void checkFilm() {
    // проверить, есть ли фильм в бд
    if (user != null) {
      DatabaseReference filmRef =
          FirebaseDatabase.instance.ref().child('films').child(user!.uid);
      filmRef.get().then((querySnapshot) {
        for (var result in querySnapshot.children) {
          if (result.children.isNotEmpty) {
            if (id == result.child('id').value) {
              addedFilmId = result.child('filmId').value.toString();
              setState(() {
                isAdded = true;
              });
            }
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Информация o фильме'),
      ),
      body: BlocBuilder<FilmInfoBloc, FilmInfoState>(
        bloc: _filmInfoBloc,
        builder: (context, state) {
          if (state is FilmInfoLoaded) {
            final infoList = state.filmInfoList[0];
            final images = state.filmsImagesList;
            filmName = infoList.nameRu ?? infoList.nameOriginal;
            imageUrl = infoList.posterUrl;
            return ScreenWidgets(
                infoList: infoList, imageUrl: imageUrl, images: images);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: (isAdded == true)
            ? const Icon(Icons.remove_rounded)
            : const Icon(Icons.add_rounded),
        onPressed: () async {
          if (filmName.isEmpty) {
            Fluttertoast.showToast(msg: 'Фильм не найден');
          }
          if (user != null) {
            String uid = user!.uid;
            DatabaseReference filmRef =
                FirebaseDatabase.instance.ref().child('films').child(uid);
            if (isAdded == false) {
              String? filmId = filmRef.push().key;
              await filmRef.child(filmId.toString()).set({
                'filmName': filmName,
                'filmId': filmId,
                'imageUrl': imageUrl,
                'id': id
              });
              checkFilm();
            }
            if (isAdded == true) {
              await filmRef.child(addedFilmId).remove();
              setState(() {
                isAdded = false;
              });
            }
          }
        },
      ),
    );
  }
}

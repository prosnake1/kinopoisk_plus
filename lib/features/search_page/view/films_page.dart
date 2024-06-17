import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kinopoisk_plus/features/search_page/bloc/films_page_bloc.dart';
import 'package:kinopoisk_plus/features/search_page/widgets/widgets.dart';
import 'package:kinopoisk_plus/repositories/films_list/films_list_repository.dart';

class FilmsPage extends StatefulWidget {
  const FilmsPage({super.key});

  @override
  State<FilmsPage> createState() => _FilmsPageState();
}

class _FilmsPageState extends State<FilmsPage> {
  final _filmsPageBloc = FilmsPageBloc(FilmsListRepository('мстители', 1));
  User? user;
  DatabaseReference? filmRef;
  late TextEditingController textController;
  String text = '';
  int page = 1;
  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Поиск'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 210,
            child: TextField(
              controller: textController,
              onSubmitted: (String value) {
                text = textController.text;
                _filmsPageBloc.add(SearchFilmsEvent(text, 1));
              },
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: BlocBuilder<FilmsPageBloc, FilmsPageState>(
              bloc: _filmsPageBloc,
              builder: (context, state) {
                if (state is FilmsPageLoaded) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: state.pageFilmList[0].films.length,
                    itemBuilder: (context, i) {
                      final film = state.pageFilmList[0].films[i];
                      return FilmTile(film: film);
                    },
                  );
                }
                return const Center(child: Text('Ищите фильмы прямо сейчас!'));
              },
            ),
          ),
          BlocBuilder<FilmsPageBloc, FilmsPageState>(
            bloc: _filmsPageBloc,
            builder: (context, state) {
              if (state is FilmsPageLoaded) {
                final pagesCount = state.pageFilmList[0].pagesCount;
                return (pagesCount == 0)
                    ? const SizedBox()
                    : SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  if (page > 1) {
                                    page--;
                                    _filmsPageBloc
                                        .add(SearchFilmsEvent(text, page));
                                  }
                                },
                                icon: const Icon(Icons.chevron_left_outlined)),
                            Text('${state.page.toString()}/$pagesCount'),
                            IconButton(
                                onPressed: () {
                                  if (page < pagesCount) {
                                    page++;
                                    _filmsPageBloc
                                        .add(SearchFilmsEvent(text, page));
                                  }
                                },
                                icon: const Icon(Icons.chevron_right_outlined))
                          ],
                        ),
                      );
              }
              return const SizedBox();
            },
          )
        ],
      ),
    );
  }
}

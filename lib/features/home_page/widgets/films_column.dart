import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kinopoisk_plus/features/home_page/bloc/films_list_bloc.dart';
import 'package:kinopoisk_plus/features/home_page/widgets/widgets.dart';

class FilmsColumn extends StatelessWidget {
  const FilmsColumn({
    super.key,
    required FilmsListBloc filmsListBloc,
  }) : _filmsListBloc = filmsListBloc;

  final FilmsListBloc _filmsListBloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
          child: Text('ТОП 10 ФИЛЬМОВ🔥', style: TextStyle(fontSize: 24)),
        ),
        Expanded(
            child: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _filmsListBloc.add(LoadFilmsList(completer: completer));
            return completer.future;
          },
          child: BlocBuilder<FilmsListBloc, FilmsListState>(
            bloc: _filmsListBloc,
            builder: (context, state) {
              if (state is FilmsListLoaded) {
                return ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                          height: 30,
                        ),
                    itemCount: state.topFilmsList.length,
                    itemBuilder: (context, i) {
                      final film = state.topFilmsList[i];
                      final topPlace = i;
                      return FilmBoxTile(film: film, topPlace: topPlace);
                    });
              }
              if (state is FilmsListLoadingFailure) {
                return const Center(child: Text('Что-то пошло не так.'));
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        )),
        const ActionButtons()
      ],
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kinopoisk_plus/features/home_page/bloc/films_list_bloc.dart';
import 'package:kinopoisk_plus/features/home_page/widgets/widgets.dart';
import 'package:kinopoisk_plus/repositories/repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _filmsListBloc = FilmsListBloc(TopFilmsRepository());
  final currentUser = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    _filmsListBloc.add(LoadFilmsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Главная',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        leading: const ExitButton(),
      ),
      body: FilmsColumn(filmsListBloc: _filmsListBloc),
    );
  }
}

import 'package:kinopoisk_plus/features/collection_page/view/collection_page.dart';
import 'package:kinopoisk_plus/features/search_page/films_page.dart';
import 'package:kinopoisk_plus/features/login_page/view/login_page.dart';
import 'package:kinopoisk_plus/features/sign_up_page/view/sign_up_page.dart';
import 'features/film_page/view/film_info.dart';
import 'features/home_page/view/home_page_screen.dart';

final router = {
  '/top': (context) => const HomePage(),
  '/search': (context) => const FilmsPage(),
  '/search/film': (context) => const FilmInfoPage(),
  '/login': (context) => const LoginPage(),
  '/collection': (context) => const FilmsCollection(),
  '/sign-up': (context) => const SignUpPage()
};

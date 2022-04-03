import 'package:flutter/material.dart';
import 'package:flutter_the_movie_database/login/auth_model.dart';
import 'package:flutter_the_movie_database/login/login.dart';
import 'package:flutter_the_movie_database/pages/film/film.dart';
import 'package:flutter_the_movie_database/pages/main_page/main_page.dart';
import 'package:provider/provider.dart';

abstract class RoutesKeys {
  static const auth = 'auth';
  static const main_page = '/';
  static const film = '/film';
}

class Routes {
  String initialRoute(bool isAuth) => isAuth ? RoutesKeys.main_page : RoutesKeys.auth;

  final routes = <String, Widget Function(BuildContext)>{
    RoutesKeys.auth: (context) => ChangeNotifierProvider(
        create: (context) => AuthModel(),
        child: const AuthWidget()),
    RoutesKeys.main_page: (context) => const MainPage(),
    RoutesKeys.film: (context) {
      final id = ModalRoute.of(context)?.settings.arguments;
      if (id is int) {
        return Film(filmId: id);
      } else {
        return Film(filmId: 0);
      }
    }
  };
}
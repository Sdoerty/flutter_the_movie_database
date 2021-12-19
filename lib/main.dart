import 'package:flutter/material.dart';
import 'package:flutter_the_movie_database/login.dart';
import 'package:flutter_the_movie_database/pages/film/film.dart';
import 'package:flutter_the_movie_database/pages/main_page/main_page.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Color.fromRGBO(3, 37, 65, 1)),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Color.fromRGBO(3, 37, 65, 1),
              unselectedItemColor: Colors.blueAccent,
              selectedItemColor: Colors.white)),
      routes: {
        '/': (context) => const LoginPage(),
        '/main_page': (context) => const MainPage(),
        '/main_page/film': (context) {
          final id = ModalRoute.of(context)?.settings.arguments;
          if (id is int){
            return Film(filmId: id);
          }else{
            return Film(filmId: 0);
          }
        }
      },
      initialRoute: '/',
    ));

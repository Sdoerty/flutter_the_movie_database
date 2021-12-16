import 'package:flutter/material.dart';
import 'package:flutter_the_movie_database/login.dart';
import 'package:flutter_the_movie_database/pages/main_page/main_page.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(appBarTheme: AppBarTheme(color: Color.fromRGBO(3, 37, 65, 1))),
      routes: {
        '/': (context) => const LoginPage(),
        '/main_page': (context) => const MainPage(),
      },
      initialRoute: '/',
    ));

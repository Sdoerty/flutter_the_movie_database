import 'package:flutter/material.dart';
import 'package:flutter_the_movie_database/login/auth_model.dart';
import 'package:flutter_the_movie_database/login/login.dart';
import 'package:flutter_the_movie_database/main_model.dart';
import 'package:flutter_the_movie_database/pages/film/film.dart';
import 'package:flutter_the_movie_database/pages/main_page/main_page.dart';
import 'package:flutter_the_movie_database/routes.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final model = MainModel();
  await model.checkAuth();
  final app = RootApp(main_model: model);
  runApp(app);
}

class RootApp extends StatelessWidget {
  final MainModel main_model;
  static final mainRoutes = Routes();
  const RootApp({Key? key, required this.main_model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Color.fromRGBO(3, 37, 65, 1)),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Color.fromRGBO(3, 37, 65, 1),
              unselectedItemColor: Colors.blueAccent,
              selectedItemColor: Colors.white)),
      routes: mainRoutes.routes,
      initialRoute: "/",
      // initialRoute: mainRoutes.initialRoute(main_model.isAuth),
    );
  }
}


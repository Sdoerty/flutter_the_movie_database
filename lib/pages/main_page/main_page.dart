import 'package:flutter/material.dart';
import 'package:flutter_the_movie_database/pages/style/appbar_style.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle.appbar_style
    );
  }
}

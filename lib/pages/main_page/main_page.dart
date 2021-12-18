import 'package:flutter/material.dart';
import 'package:flutter_the_movie_database/pages/style/appbar_style.dart';
import 'package:flutter_the_movie_database/pages/films_page/films_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  List<Widget> _activities = [
    Text('Home'),
    FilmsPage(),
    Text('Serials'),
  ];

  onTapSelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyle.appbar_style,
        body: _activities[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.bubble_chart_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Films'),
            BottomNavigationBarItem(
                icon: Icon(Icons.computer), label: 'Series')
          ],
          onTap: onTapSelect,
        ));
  }
}

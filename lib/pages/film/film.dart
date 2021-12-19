import 'package:flutter/material.dart';

class Film extends StatefulWidget {
  const Film({Key? key, required this.filmId}) : super(key: key);

  final int filmId;

  @override
  _FilmState createState() => _FilmState();
}

class _FilmState extends State<Film> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FilmName'),
      ),
      body: Text('FilmName'),
    );
  }
}

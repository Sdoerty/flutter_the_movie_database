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
        title: Text('Spider Man'),
      ),
      body: Container(
        child: ListView(
          children: [
            ColoredBox(
              color: Color.fromRGBO(21, 21, 42, 1.0),
                child: FilmInfo()),
            Text('2 block')
          ],
        ),
      ),
    );
  }
}


class FilmInfo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Image(image: AssetImage('images/filmImage.jpg')),
            Positioned(
              top: 20,
              left: 20,
              bottom: 20,
              child: Container(
                  height: 200,
                  child: Image(image: AssetImage('images/picinpic.jpg'))),
            ),
          ],
        ),

      ],
    );
  }

}
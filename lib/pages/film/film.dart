import 'package:flutter/cupertino.dart';
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
        child: ColoredBox(
          color: Color.fromRGBO(14, 21, 32, 1.0),
          child: ListView(
            children: [
              Container(child: FilmInfo()),
              Container(
                  color: Color.fromRGBO(13, 19, 29, 1.0),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
                  child: FilmGenre()),
              Container(padding: EdgeInsets.all(16), child: FilmOverview()),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                color: Colors.white,
                child: FilmCast(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FilmInfo extends StatelessWidget {
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
        Container(
          padding: EdgeInsets.all(16),
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: 'Spider-Man: Far From Home ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 21)),
                TextSpan(text: '(2021)'),
              ])),
        ),
        Row(
          children: [
            Expanded(
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    '75% User Score',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ),
            Container(
              color: Colors.grey,
              width: 1,
              height: 25,
            ),
            Expanded(
              child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Play Trailer',
                    style: TextStyle(color: Colors.white),
                  )),
            )
          ],
        )
      ],
    );
  }
}

class FilmGenre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '12+ 07/04/2019 (RU) 2h 9m Action, Adventure, Science Fiction',
      style: TextStyle(color: Colors.white),
      maxLines: 3,
      textAlign: TextAlign.center,
    );
  }
}

class FilmOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Overview',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Peter Parker and his friends go on a summer trip to Europe. '
          'However, they will hardly be able to rest - '
          'Peter will have to agree to help Nick Fury uncover the mystery '
          'of creatures that cause natural disasters and destruction throughout the continent.',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 30,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'Jon Watts',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    Text(
                      'Director',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Eric Sommers',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    Text(
                      'Screenplay',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Jon Watts',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    Text(
                      'Director',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Chris McKenna',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                    Text(
                      'Writer',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

class FilmCast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Top Billed Cast',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black87),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 250,
          child: Scrollbar(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemExtent: 120,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.all(8),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.grey),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 2)
                          )
                        ]
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(image: AssetImage('images/actor.jpg')),
                              SizedBox(height: 10),
                              Text(
                                'Tom Holland',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black87),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Peter Parker / Spider Man',
                                style: TextStyle(fontSize: 14, color: Colors.black87),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                      ),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }
}

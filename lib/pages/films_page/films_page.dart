import 'package:flutter/material.dart';

class Movie {
  int id;
  String filmImage;
  String filmName;
  String filmDate;
  String filmDescription;

  Movie(
      {required this.id,
      required this.filmImage,
      required this.filmName,
      required this.filmDate,
      required this.filmDescription});
}

class FilmsPage extends StatefulWidget {
  const FilmsPage({Key? key}) : super(key: key);

  @override
  _FilmsPageState createState() => _FilmsPageState();
}

class _FilmsPageState extends State<FilmsPage> {
  final _movies = [
    Movie(
        id: 1,
        filmImage: 'images/poster.jpg',
        filmName: 'Spider-Man: No Way Home',
        filmDate: 'December 15, 2021',
        filmDescription:
            'Peter Parker is unmasked and no longer able to separate his normal '
            'life from the high-stakes of being a super-hero. When he asks for help '
            'from Doctor Strange the stakes become even more dangerous, forcing him to '
            'discover what it truly means to be Spider-Man.'),
    Movie(
        id: 2,
        filmImage: 'images/poster.jpg',
        filmName: 'Spider-Man: Europe',
        filmDate: 'September 11, 2019',
        filmDescription:
            'Peter Parker is unmasked and no longer able to separate his normal '
            'life from the high-stakes of being a super-hero. When he asks for help '
            'from Doctor Strange the stakes become even more dangerous, forcing him to '
            'discover what it truly means to be Spider-Man.'),
    Movie(
        id: 3,
        filmImage: 'images/poster.jpg',
        filmName: 'Batman 1',
        filmDate: 'December 15, 2021',
        filmDescription:
            'Peter Parker is unmasked and no longer able to separate his normal '
            'life from the high-stakes of being a super-hero. When he asks for help '
            'from Doctor Strange the stakes become even more dangerous, forcing him to '
            'discover what it truly means to be Spider-Man.'),
    Movie(
        id: 4,
        filmImage: 'images/poster.jpg',
        filmName: 'Super Man',
        filmDate: 'December 15, 2021',
        filmDescription:
            'Peter Parker is unmasked and no longer able to separate his normal '
            'life from the high-stakes of being a super-hero. When he asks for help '
            'from Doctor Strange the stakes become even more dangerous, forcing him to '
            'discover what it truly means to be Spider-Man.'),
    Movie(
        id: 5,
        filmImage: 'images/poster.jpg',
        filmName: 'Avengers',
        filmDate: 'December 15, 2021',
        filmDescription:
            'Peter Parker is unmasked and no longer able to separate his normal '
            'life from the high-stakes of being a super-hero. When he asks for help '
            'from Doctor Strange the stakes become even more dangerous, forcing him to '
            'discover what it truly means to be Spider-Man.')
  ];

  var _filteredMovie = <Movie>[];
  final _searchController = TextEditingController();

  void _searchMovie() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovie = _movies.where((Movie movie) {
        return movie.filmName.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovie = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredMovie = _movies;
    _searchController.addListener(_searchMovie);
  }

  onFilmTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed('/main_page/film', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.only(top: 70),
            itemCount: _filteredMovie.length,
            itemBuilder: (BuildContext context, int index) {
              final movie = _filteredMovie[index];
              return Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                height: 155,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Image(
                          image: AssetImage(movie.filmImage),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                movie.filmName,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                movie.filmDate,
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                movie.filmDescription,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => onFilmTap(index),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
                labelText: 'Search',
                filled: true,
                fillColor: Colors.white.withAlpha(235),
                border: OutlineInputBorder()),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_the_movie_database/domain/api_client.dart';
import 'package:flutter_the_movie_database/domain/movie.dart';
import 'package:flutter_the_movie_database/routes.dart';

class MovieListModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _movies = <Movie>[];
  List<Movie> get movies => List.unmodifiable(_movies);

  Future<void> loadMovies() async{
    final moviesResponse = await _apiClient.popularMovie(1, 'ru-RU');
    _movies.addAll(moviesResponse.movies);
    notifyListeners();
  }

  void onMovieTap(BuildContext context, int index){
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(RoutesKeys.film, arguments: id);
  }
}
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

// https://developers.themoviedb.org/3/movies/get-popular-movies

@JsonSerializable(fieldRename:  FieldRename.snake)
class Movie {
  final String? posterPath;
  final bool adult;
  final String overview;
  @JsonKey(fromJson: _parseDateFromString)
  final DateTime? releaseDate;
  final List<int> genre_ids;
  final int id;
  final String originalTitle;
  final String title;
  final String? backgroundPath;
  final double popularity;
  final int voteCount;
  final bool video;
  final double voteAverage;

  Movie(
      this.posterPath,
      this.adult,
      this.overview,
      this.releaseDate,
      this.genre_ids,
      this.id,
      this.originalTitle,
      this.title,
      this.backgroundPath,
      this.popularity,
      this.voteCount,
      this.video,
      this.voteAverage);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  static DateTime? _parseDateFromString(String? rawDate){
    if(rawDate == null || rawDate.isEmpty) return null;
    return DateTime.tryParse(rawDate);
  }

}

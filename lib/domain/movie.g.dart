// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      json['poster_path'] as String?,
      json['adult'] as bool,
      json['overview'] as String,
      Movie._parseDateFromString(json['release_date'] as String?),
      (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      json['id'] as int,
      json['original_title'] as String,
      json['title'] as String,
      json['background_path'] as String?,
      (json['popularity'] as num).toDouble(),
      json['vote_count'] as int,
      json['video'] as bool,
      (json['vote_average'] as num).toDouble(),
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'poster_path': instance.posterPath,
      'adult': instance.adult,
      'overview': instance.overview,
      'release_date': instance.releaseDate?.toIso8601String(),
      'genre_ids': instance.genre_ids,
      'id': instance.id,
      'original_title': instance.originalTitle,
      'title': instance.title,
      'background_path': instance.backgroundPath,
      'popularity': instance.popularity,
      'vote_count': instance.voteCount,
      'video': instance.video,
      'vote_average': instance.voteAverage,
    };

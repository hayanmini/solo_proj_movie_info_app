import 'package:flutter_movie_info_app/features/movie_info/domain/entity/movie.dart';

class MovieResponseDto extends Movie {
  MovieResponseDto({required super.id, required super.posterPath});

  factory MovieResponseDto.fromJson(Map<String, dynamic> json) {
    return MovieResponseDto(
      id: json["id"],
      posterPath: json["poster_path"] ?? "",
    );
  }

  Movie toEntity() {
    return Movie(id: id, posterPath: posterPath);
  }
}

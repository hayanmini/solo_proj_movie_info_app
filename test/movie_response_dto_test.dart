import 'dart:convert';

import 'package:flutter_movie_info_app/features/movie_info/data/dto/movie_response_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("MovieDto : formJson test", () {
    var sampleJsonString = """
      {
        "adult": false,
        "backdrop_path": "/iZLqwEwUViJdSkGVjePGhxYzbDb.jpg",
        "genre_ids": [
          878,
          53
        ],
        "id": 755898,
        "original_language": "en",
        "original_title": "War of the Worlds",
        "overview": "Will Radford is a top analyst for Homeland Security who tracks potential threats through a mass surveillance program, until one day an attack by an unknown entity leads him to question whether the government is hiding something from him... and from the rest of the world.",
        "popularity": 1181.4284,
        "poster_path": "/yvirUYrva23IudARHn3mMGVxWqM.jpg",
        "release_date": "2025-07-29",
        "title": "War of the Worlds",
        "video": false,
        "vote_average": 4.253,
        "vote_count": 403
      }
""";

    final movie = MovieResponseDto.fromJson(jsonDecode(sampleJsonString));
    expect(movie.id, 755898);
    expect(movie.posterPath, "/yvirUYrva23IudARHn3mMGVxWqM.jpg");
  });
}

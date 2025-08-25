import 'dart:convert';

import 'package:flutter_movie_info_app/features/movie_info/data/dto/movie_detail_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Movie Detail : fromJson test", () {
    var sampleJsonString = """
    {
      "adult": false,
      "backdrop_path": "/pNjh59JSxChQktamG3LMp9ZoQzp.jpg",
      "budget": 25000000,
      "genres": [
        {"id": 18, "name": "Drama"},
        {"id": 80, "name": "Crime"}
      ],
      "id": 278,
      "overview": "Imprisoned in the 1940s...",
      "popularity": 27.7525,
      "poster_path": "/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg",
      "production_companies": [
        {
          "id": 97,
          "logo_path": "/7znWcbDd4PcJzJUlJxYqAlPPykp.png",
          "name": "Castle Rock Entertainment",
          "origin_country": "US"
        }
      ],
      "release_date": "1994-09-23",
      "revenue": 28341469,
      "runtime": 142,
      "tagline": "Fear can hold you prisoner. Hope can set you free.",
      "title": "The Shawshank Redemption",
      "vote_average": 8.712,
      "vote_count": 28753
    }
    """;

    final movie = MovieDetailDto.fromJson(jsonDecode(sampleJsonString));

    expect(movie.voteAverage, 8.712);
    expect(
      movie.productionCompanyLogos.first,
      "/7znWcbDd4PcJzJUlJxYqAlPPykp.png",
    );
  });
}

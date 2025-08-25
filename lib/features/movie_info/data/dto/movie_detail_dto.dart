import 'package:flutter_movie_info_app/features/movie_info/domain/entity/movie_detail.dart';

class MovieDetailDto {
  // 포스터, 제목, 개봉일, 태그라인, 상영시간, 장르 리스트, 줄거리
  final String posterPath;
  final String title;
  final DateTime releaseDate;
  final String tagline;
  final int runtime;
  final List<String> genres;
  final String overview;

  // 흥행 정보 - 평점 평점투표수 인기점수 예산 수익
  final double voteAverage;
  final int voteCount;
  final double popularity;
  final int budget;
  final int revenue;

  // 회사 로고 리스트
  final List<String> productionCompanyLogos;

  MovieDetailDto({
    required this.posterPath,
    required this.title,
    required this.releaseDate,
    required this.tagline,
    required this.runtime,
    required this.genres,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.budget,
    required this.revenue,
    required this.productionCompanyLogos,
  });

  // {
  //   "adult": false,
  //   "backdrop_path": "/pNjh59JSxChQktamG3LMp9ZoQzp.jpg",
  //   "belongs_to_collection": null,
  //   "budget": 25000000,
  //   "genres": [
  //     {
  //       "id": 18,
  //       "name": "Drama"
  //     },
  //     {
  //       "id": 80,
  //       "name": "Crime"
  //     }
  //   ],
  //   "homepage": "",
  //   "id": 278,
  //   "imdb_id": "tt0111161",
  //   "origin_country": [
  //     "US"
  //   ],
  //   "original_language": "en",
  //   "original_title": "The Shawshank Redemption",
  //   "overview": "Imprisoned in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
  //   "popularity": 27.7525,
  //   "poster_path": "/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg",
  //   "production_companies": [
  //     {
  //       "id": 97,
  //       "logo_path": "/7znWcbDd4PcJzJUlJxYqAlPPykp.png",
  //       "name": "Castle Rock Entertainment",
  //       "origin_country": "US"
  //     }
  //   ],
  //   "production_countries": [
  //     {
  //       "iso_3166_1": "US",
  //       "name": "United States of America"
  //     }
  //   ],
  //   "release_date": "1994-09-23",
  //   "revenue": 28341469,
  //   "runtime": 142,
  //   "spoken_languages": [
  //     {
  //       "english_name": "English",
  //       "iso_639_1": "en",
  //       "name": "English"
  //     }
  //   ],
  //   "status": "Released",
  //   "tagline": "Fear can hold you prisoner. Hope can set you free.",
  //   "title": "The Shawshank Redemption",
  //   "video": false,
  //   "vote_average": 8.712,
  //   "vote_count": 28753
  // }
  factory MovieDetailDto.fromJson(Map<String, dynamic> json) {
    return MovieDetailDto(
      posterPath: json["poster_path"] ?? "",
      title: json["title"] ?? "",
      releaseDate:
          DateTime.tryParse(json["releaseDate"] ?? "") ?? DateTime(0000),
      tagline: json["tagline"] ?? "",
      runtime: json["runtime"] ?? 0,
      genres:
          (json["genres"] as List<dynamic>?)
              ?.map((e) => e["name"] as String)
              .toList() ??
          [],
      overview: json["overview"] ?? "",
      voteAverage: (json["vote_average"] as num?)?.toDouble() ?? 0.0,
      voteCount: json["vote_count"] ?? 0,
      popularity: json["popularity"] ?? 0.0,
      budget: json["budget"] ?? 0,
      revenue: json["revenue"] ?? 0,
      productionCompanyLogos:
          (json["production_companies"] as List<dynamic>?)
              ?.map((f) => f["logo_path"] as String)
              .toList() ??
          [],
    );
  }

  MovieDetail toEntity() {
    return MovieDetail(
      posterPath: posterPath,
      title: title,
      releaseDate: releaseDate,
      tagline: tagline,
      runtime: runtime,
      genres: genres,
      overview: overview,
      voteAverage: voteAverage,
      voteCount: voteCount,
      popularity: popularity,
      budget: budget,
      revenue: revenue,
      productionCompanyLogos: productionCompanyLogos,
    );
  }
}

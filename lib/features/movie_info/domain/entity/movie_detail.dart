class MovieDetail {
  // 제목, 개봉일, 태그라인, 상영시간, 장르 리스트, 줄거리
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

  MovieDetail({
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
}

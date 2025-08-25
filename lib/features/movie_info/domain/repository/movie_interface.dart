import 'package:flutter_movie_info_app/features/movie_info/domain/entity/movie.dart';
import 'package:flutter_movie_info_app/features/movie_info/domain/entity/movie_detail.dart';

// 어떤 기능이 필요한지만 명세 - (구현X)
abstract interface class MovieRepository {
  Future<List<Movie>?> getNowPlayingMovies();
  Future<List<Movie>?> getPopularMovies();
  Future<List<Movie>?> getTopRatedMovies();
  Future<List<Movie>?> getUpcomingMovies();

  Future<MovieDetail?> getMovieDetail(int id);
}

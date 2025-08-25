import 'package:flutter_movie_info_app/features/movie_info/domain/entity/movie.dart';
import 'package:flutter_movie_info_app/features/movie_info/domain/repository/movie_interface.dart';

class GetNowPlayingMovies {
  final MovieRepository repository;
  GetNowPlayingMovies(this.repository);

  Future<List<Movie>?> call() async {
    return await repository.getNowPlayingMovies();
  }
}

class GetPopularMovies {
  final MovieRepository repository;
  GetPopularMovies(this.repository);

  Future<List<Movie>?> call() async {
    return await repository.getPopularMovies();
  }
}

class GetTopRatedMovies {
  final MovieRepository repository;
  GetTopRatedMovies(this.repository);

  Future<List<Movie>?> call() async {
    return await repository.getTopRatedMovies();
  }
}

class GetUpcomingMovies {
  final MovieRepository repository;
  GetUpcomingMovies(this.repository);

  Future<List<Movie>?> call() async {
    return await repository.getUpcomingMovies();
  }
}

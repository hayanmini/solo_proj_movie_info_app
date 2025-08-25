import 'package:flutter_movie_info_app/features/movie_info/domain/entity/movie.dart';
import 'package:flutter_movie_info_app/features/movie_info/domain/repository/movie_interface.dart';

class GetNowPlayingMovies {
  final MovieRepository _repository;
  GetNowPlayingMovies(this._repository);

  Future<List<Movie>?> call() async {
    return await _repository.getNowPlayingMovies();
  }
}

class GetPopularMovies {
  final MovieRepository _repository;
  GetPopularMovies(this._repository);

  Future<List<Movie>?> call() async {
    return await _repository.getPopularMovies();
  }
}

class GetTopRatedMovies {
  final MovieRepository _repository;
  GetTopRatedMovies(this._repository);

  Future<List<Movie>?> call() async {
    return await _repository.getTopRatedMovies();
  }
}

class GetUpcomingMovies {
  final MovieRepository _repository;
  GetUpcomingMovies(this._repository);

  Future<List<Movie>?> call() async {
    return await _repository.getUpcomingMovies();
  }
}

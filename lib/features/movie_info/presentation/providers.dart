import 'package:flutter_movie_info_app/features/movie_info/data/datasource/movie_remote_data_source.dart';
import 'package:flutter_movie_info_app/features/movie_info/data/repository/movie_repository_impl.dart';
import 'package:flutter_movie_info_app/features/movie_info/domain/repository/movie_interface.dart';
import 'package:flutter_movie_info_app/features/movie_info/domain/usecases/get_movie_detail.dart';
import 'package:flutter_movie_info_app/features/movie_info/domain/usecases/get_movie_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Repository Provider
final movieRepositoryProvider = Provider<MovieRepository>((ref) {
  final remoteDataSource = MovieRemoteDataSource();
  return MovieRepositoryImpl(remoteDataSource);
});

// UseCase Provider
final getNowPlayingMoviesProvider = Provider<GetNowPlayingMovies>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return GetNowPlayingMovies(repository);
});

// 인기순만 새로고침 할 때 사용
final getPopularMoviesProvider = Provider<GetPopularMovies>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return GetPopularMovies(repository);
});

final getTopRatedMoviesProvider = Provider<GetTopRatedMovies>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return GetTopRatedMovies(repository);
});

final getUpcomingMoviesProvider = Provider<GetUpcomingMovies>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return GetUpcomingMovies(repository);
});

final getMovieDetailProvider = Provider<GetMovieDetail>((ref) {
  final repository = ref.watch(movieRepositoryProvider);
  return GetMovieDetail(repository);
});

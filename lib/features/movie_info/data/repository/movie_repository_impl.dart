import 'package:flutter_movie_info_app/features/movie_info/data/datasource/movie_remote_data_source.dart';
import 'package:flutter_movie_info_app/features/movie_info/domain/entity/movie.dart';
import 'package:flutter_movie_info_app/features/movie_info/domain/entity/movie_detail.dart';
import 'package:flutter_movie_info_app/features/movie_info/domain/repository/movie_interface.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Movie>?> getNowPlayingMovies() async {
    final dto = await remoteDataSource.getNowPlayingMovies();
    if (dto == null) return [];

    return dto.map((dto) => dto.toEntity()).toList();
  }

  @override
  Future<List<Movie>?> getPopularMovies() async {
    final dto = await remoteDataSource.getPopularMovies();
    if (dto == null) return [];

    return dto.map((dto) => dto.toEntity()).toList();
  }

  @override
  Future<List<Movie>?> getTopRatedMovies() async {
    final dto = await remoteDataSource.getTopRatedMovies();
    if (dto == null) return [];

    return dto.map((dto) => dto.toEntity()).toList();
  }

  @override
  Future<List<Movie>?> getUpcomingMovies() async {
    final dto = await remoteDataSource.getUpcomingMovies();
    if (dto == null) return [];

    return dto.map((dto) => dto.toEntity()).toList();
  }

  @override
  Future<MovieDetail?> getMovieDetail(int id) async {
    final dto = await remoteDataSource.getMovieDetail(id);
    return dto;
  }
}

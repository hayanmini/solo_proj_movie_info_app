import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_info_app/features/movie_info/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_info_app/features/movie_info/data/dto/movie_response_dto.dart';
import 'package:flutter_movie_info_app/features/movie_info/domain/entity/movie_detail.dart';
import 'package:flutter_movie_info_app/features/movie_info/domain/repository/movie_interface.dart';

class MovieRemoteDataSource implements MovieRepository {
  final Dio _client = Dio(BaseOptions(validateStatus: (status) => true));

  String get _apiKey => dotenv.env["API_KEY"] ?? "";

  @override
  Future<List<MovieResponseDto>?> getNowPlayingMovies() async {
    final response = await _client.get(
      "https://api.themoviedb.org/3/movie/now_playing",
      options: Options(
        headers: {
          "Authorization": "Bearer $_apiKey",
          "accept": "application/json",
        },
      ),
    );
    if (response.statusCode == 200) {
      return List.of(
        (response.data["results"]),
      ).map((e) => MovieResponseDto.fromJson(e)).toList();
    }
    return [];
  }

  @override
  Future<List<MovieResponseDto>?> getPopularMovies() async {
    final response = await _client.get(
      "https://api.themoviedb.org/3/movie/popular",
      options: Options(
        headers: {
          "Authorization": "Bearer $_apiKey",
          "accept": "application/json",
        },
      ),
    );
    if (response.statusCode == 200) {
      return List.of(
        (response.data["results"]),
      ).map((e) => MovieResponseDto.fromJson(e)).toList();
    }
    return [];
  }

  @override
  Future<List<MovieResponseDto>?> getTopRatedMovies() async {
    final response = await _client.get(
      "https://api.themoviedb.org/3/movie/top_rated",
      options: Options(
        headers: {
          "Authorization": "Bearer $_apiKey",
          "accept": "application/json",
        },
      ),
    );
    if (response.statusCode == 200) {
      return List.of(
        (response.data["results"]),
      ).map((e) => MovieResponseDto.fromJson(e)).toList();
    }
    return [];
  }

  @override
  Future<List<MovieResponseDto>?> getUpcomingMovies() async {
    final response = await _client.get(
      "https://api.themoviedb.org/3/movie/upcoming",
      options: Options(
        headers: {
          "Authorization": "Bearer $_apiKey",
          "accept": "application/json",
        },
      ),
    );
    if (response.statusCode == 200) {
      return List.of(
        (response.data["results"]),
      ).map((e) => MovieResponseDto.fromJson(e)).toList();
    }
    return [];
  }

  @override
  Future<MovieDetail?> getMovieDetail(int id) async {
    final response = await _client.get(
      "https://api.themoviedb.org/3/movie/$id",
      options: Options(
        headers: {
          "Authorization": "Bearer $_apiKey",
          "accept": "application/json",
        },
      ),
    );
    if (response.statusCode == 200) {
      final result = MovieDetailDto.fromJson(response.data);
      return result.toEntity();
    }
    return null;
  }
}

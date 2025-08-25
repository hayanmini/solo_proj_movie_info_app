import 'package:flutter_movie_info_app/features/movie_info/domain/entity/movie_detail.dart';
import 'package:flutter_movie_info_app/features/movie_info/domain/repository/movie_interface.dart';

class GetMovieDetail {
  GetMovieDetail(this._repository);
  final MovieRepository _repository;

  Future<MovieDetail?> call(id) async {
    return await _repository.getMovieDetail(id);
  }
}

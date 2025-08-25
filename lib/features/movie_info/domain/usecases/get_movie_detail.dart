import 'package:flutter_movie_info_app/features/movie_info/domain/entity/movie_detail.dart';
import 'package:flutter_movie_info_app/features/movie_info/domain/repository/movie_interface.dart';

class GetMovieDetail {
  final MovieRepository repository;
  GetMovieDetail(this.repository);

  Future<MovieDetail?> call(id) async {
    return await repository.getMovieDetail(id);
  }
}

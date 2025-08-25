import 'dart:async';

import 'package:flutter_movie_info_app/features/movie_info/domain/entity/movie_detail.dart';
import 'package:flutter_movie_info_app/features/movie_info/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailViewmodel
    extends AutoDisposeFamilyAsyncNotifier<MovieDetail?, int> {
  @override
  FutureOr<MovieDetail?> build(int id) async {
    final getMovieDetail = ref.read(getMovieDetailProvider);
    return await getMovieDetail(id);
  }
}

final movieDetailProvider =
    AutoDisposeAsyncNotifierProviderFamily<
      MovieDetailViewmodel,
      MovieDetail?,
      int
    >(MovieDetailViewmodel.new);

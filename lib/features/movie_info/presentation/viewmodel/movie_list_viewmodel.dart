import 'dart:async';

import 'package:flutter_movie_info_app/features/movie_info/domain/entity/movie.dart';
import 'package:flutter_movie_info_app/features/movie_info/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieListState {
  final List<Movie> nowPlaying;
  final List<Movie> popular;
  final List<Movie> topRated;
  final List<Movie> upcoming;
  final bool isLoading;
  final String? error;

  const MovieListState({
    this.nowPlaying = const [],
    this.popular = const [],
    this.topRated = const [],
    this.upcoming = const [],
    this.isLoading = false,
    this.error,
  });

  MovieListState copyWith({
    List<Movie>? nowPlaying,
    List<Movie>? popular,
    List<Movie>? topRated,
    List<Movie>? upcoming,
    bool? isLoading,
    String? error,
  }) {
    return MovieListState(
      nowPlaying: nowPlaying ?? this.nowPlaying,
      popular: popular ?? this.popular,
      topRated: topRated ?? this.topRated,
      upcoming: upcoming ?? this.upcoming,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

class MovieListViewmodel extends AutoDisposeNotifier<MovieListState> {
  @override
  MovieListState build() {
    Future.microtask(fetchMovies);
    return const MovieListState(isLoading: true);
  }

  Future<void> fetchMovies() async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final repo = ref.read(movieRepositoryProvider);

      final nowPlaying = await repo.getNowPlayingMovies();
      final popular = await repo.getPopularMovies();
      final topRated = await repo.getTopRatedMovies();
      final upcoming = await repo.getUpcomingMovies();

      state = state.copyWith(
        nowPlaying: nowPlaying ?? [],
        popular: popular ?? [],
        topRated: topRated ?? [],
        upcoming: upcoming ?? [],
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}

final movieListProvider =
    AutoDisposeNotifierProvider<MovieListViewmodel, MovieListState>(
      MovieListViewmodel.new,
    );

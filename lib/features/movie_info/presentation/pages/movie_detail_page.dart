import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/features/movie_info/presentation/viewmodel/movie_detail_viewmodel.dart';
import 'package:flutter_movie_info_app/features/movie_info/presentation/widgets/movie_detail_info.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieDetailPage extends ConsumerWidget {
  final int movieId;
  const MovieDetailPage({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(movieDetailProvider(movieId));

    // 예외 처리
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.error != null) {
      return Center(child: Text("오류 : ${state.error}"));
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: MovieDetailInfo(movieId: movieId, data: state.value!),
        ),
      ),
    );
  }
}

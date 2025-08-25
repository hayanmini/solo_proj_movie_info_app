import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/features/movie_info/presentation/pages/movie_detail_page.dart';
import 'package:flutter_movie_info_app/features/movie_info/presentation/viewmodel/movie_list_viewmodel.dart';
import 'package:flutter_movie_info_app/features/movie_info/presentation/widgets/movie_section.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(movieListProvider);

    // 예외 처리
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.error != null) {
      return Center(child: Text("오류 : ${state.error}"));
    }

    // Padding 계산
    final topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: topPadding),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text("가장 인기있는"),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MovieDetailPage(movieId: state.popular.first.id),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 600,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(
                        "http://image.tmdb.org/t/p/w500${state.popular.first.posterPath}",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            MovieSection(
              title: "현재 상영중",
              isRank: false,
              data: state.nowPlaying,
            ),
            MovieSection(title: "인기순", isRank: true, data: state.popular),
            MovieSection(title: "평점 높은순", isRank: false, data: state.topRated),
            MovieSection(title: "개봉 예정", isRank: false, data: state.upcoming),
          ],
        ),
      ),
    );
  }
}

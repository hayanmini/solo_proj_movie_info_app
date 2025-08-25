import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/features/movie_info/domain/entity/movie.dart';
import 'package:flutter_movie_info_app/features/movie_info/presentation/pages/movie_detail_page.dart';

class MovieCard extends StatelessWidget {
  final bool isRank;
  final Movie movie;
  final int? rank;

  const MovieCard({
    super.key,
    required this.movie,
    required this.isRank,
    this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailPage(movieId: movie.id),
          ),
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // 포스터
          Container(
            margin: EdgeInsets.only(left: isRank ? 30 : 0),
            width: 120,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "http://image.tmdb.org/t/p/w500${movie.posterPath}",
                ),
              ),
            ),
          ),

          // 순위 출력
          if (isRank && rank != null)
            Positioned(
              left: 0,
              bottom: 0,
              child: Text(
                "$rank",
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

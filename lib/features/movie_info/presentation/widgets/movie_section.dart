import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/features/movie_info/presentation/widgets/movie_card.dart';

class MovieSection extends StatelessWidget {
  final String title;
  final bool isRank;

  const MovieSection({super.key, required this.title, required this.isRank});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 섹션 제목
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
          child: Text(title),
        ),
        SizedBox(height: 6),

        // 리스트
        SizedBox(
          height: 200,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 12),
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (context, index) {
              return MovieCard(
                // 이미지, 랭크 순위 여부
                isRank: isRank,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 10),
          ),
        ),
      ],
    );
  }
}

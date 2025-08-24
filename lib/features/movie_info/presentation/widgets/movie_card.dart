import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final bool isRank;
  const MovieCard({super.key, required this.isRank});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 포스터
        Container(
          width: 120,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.purple,
          ),
        ),

        // 순위 출력
        if (isRank)
          Positioned(
            left: 8,
            bottom: 8,
            child: Text(
              "1",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}

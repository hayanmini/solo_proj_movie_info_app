import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final bool isRank;
  const MovieCard({super.key, required this.isRank});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // 포스터
        Container(
          margin: EdgeInsets.only(left: isRank ? 30 : 0),
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
            left: 0,
            bottom: 0,
            child: Text(
              "1",
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}

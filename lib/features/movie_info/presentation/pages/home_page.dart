import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/features/movie_info/presentation/widgets/movie_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
              child: Container(
                width: double.infinity,
                height: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.tealAccent,
                ),
              ),
            ),
            SizedBox(height: 5),
            MovieSection(title: "현재 상영중", isRank: false),
            MovieSection(title: "인기순", isRank: true),
            MovieSection(title: "평점 높은순", isRank: false),
            MovieSection(title: "개봉 예정", isRank: false),
          ],
        ),
      ),
    );
  }
}

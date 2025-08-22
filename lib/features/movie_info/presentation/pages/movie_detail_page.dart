import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/features/movie_info/presentation/widgets/movie_detail_info.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(child: MovieDetailInfo())),
    );
  }
}

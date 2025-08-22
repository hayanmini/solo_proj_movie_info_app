import 'package:flutter/material.dart';

class MovieDetailInfo extends StatefulWidget {
  const MovieDetailInfo({super.key});

  @override
  State<MovieDetailInfo> createState() => _MovieDetailInfoState();
}

class _MovieDetailInfoState extends State<MovieDetailInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 흥행 정보 - 평점 평점투표수 인기점수 예산 수익
        // final double voteAverage;
        // final int voteCount;
        // final double popularity;
        // final int budget;
        // final int revenue;
        Container(width: double.infinity, height: 500, color: Colors.amber),
        Row(children: [Text("title"), Spacer(), Text("releaseDate")]),
        Text("tagline"),
        Text("runtime 분"),
        Divider(),
        // 장르 태그
        Divider(),
        Text("overview"),
        Divider(),
        Text("흥행정보"),
        // ListView.builder(
        //   itemCount: 5,
        //   itemBuilder: (context, index) {
        //     return Container(
        //       height: 100,
        //       decoration: BoxDecoration(
        //         color: Colors.amberAccent,
        //         borderRadius: BorderRadius.circular(10),
        //       ),
        //       child: Column(children: [Text("info"), Text("평점")]),
        //     );
        //   },
        // ),
        // 회사 로고 productionCompanyLogos
      ],
    );
  }
}

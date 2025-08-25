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
        // 영화 포스터
        Container(
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(20),
            color: Colors.amber,
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 메인 정보 - 제목, 개봉일
              Row(
                children: [
                  Text(
                    "title",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Spacer(),
                  Center(
                    child: Text(
                      "releaseDate",
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),

              // 한줄 소개
              Text("tagline"),
              SizedBox(height: 4),

              // 러닝타임
              Text("runtime분"),
              Divider(),

              // 장르 태그
              _infoGenres("genres"),
              Divider(),

              // 줄거리
              Text("overview"),
              Divider(),

              // 흥행정보
              Text("흥행정보", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  // padding: const EdgeInsets.all(5),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return _InfoDetail(
                      value: [
                        "voteAverage",
                        "voteCount",
                        "popularity",
                        "budget",
                        "revenue",
                      ][index],
                      title: ["평점", "평점투표수", "인기 점수", "예산", "수익"][index],
                    );
                  },
                ),
              ),
              SizedBox(height: 15),

              // 회사 로고 productionCompanyLogos
              SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 150,
                      height: 80,
                      color: Color(0xE6FFFFFF),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 10);
                  },
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  // 장르 태그
  SizedBox _infoGenres(dynamic genres) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: Text(genres, style: TextStyle(color: Colors.blueAccent)),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 5);
        },
      ),
    );
  }
}

// 흥행정보
class _InfoDetail extends StatelessWidget {
  final String title;
  final String value;

  const _InfoDetail({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(value), SizedBox(height: 5), Text(title)],
        ),
      ),
    );
  }
}

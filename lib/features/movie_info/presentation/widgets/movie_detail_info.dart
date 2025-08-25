import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/features/movie_info/domain/entity/movie_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class MovieDetailInfo extends ConsumerWidget {
  final int movieId;
  final MovieDetail data;

  const MovieDetailInfo({super.key, required this.movieId, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                "http://image.tmdb.org/t/p/w500${data.posterPath}",
              ),
            ),
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
                  Expanded(
                    child: Text(
                      data.title,
                      //maxLines: 1,
                      //overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    DateFormat("yyyy-MM-dd").format(data.releaseDate),
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12),
                  ),
                  SizedBox(width: 8),
                ],
              ),
              SizedBox(height: 10),

              // 한줄 소개
              Text(data.tagline),
              SizedBox(height: 4),

              // 러닝타임
              Text("${data.runtime}분"),
              Divider(),

              // 장르 태그
              _infoGenres(data.genres),
              Divider(),

              // 줄거리
              Text(data.overview),
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
                        "${data.voteAverage}",
                        "${data.voteCount}",
                        "${data.popularity}",
                        "\$${data.budget}",
                        "\$${data.revenue}",
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
                  itemCount: data.productionCompanyLogos.length,
                  itemBuilder: (context, index) {
                    var imageUrl = data.productionCompanyLogos[index];
                    if (imageUrl.isEmpty) {
                      return SizedBox.shrink();
                    }
                    return Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.network(
                          "http://image.tmdb.org/t/p/w500$imageUrl}",
                        ),
                      ),
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
  SizedBox _infoGenres(genres) {
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
            child: Text(
              genres[index],
              style: TextStyle(color: Colors.blueAccent),
            ),
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

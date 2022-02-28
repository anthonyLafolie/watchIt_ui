import 'package:flutter/material.dart';
import 'package:watch_it/model/movie_detail.dart';
import 'package:watch_it/screen/movieDetail/view/header/poster.dart';
import 'package:watch_it/screen/movieDetail/view/header/rating_information.dart';

import 'arc_banner_image.dart';

class MovieDetailHeader extends StatelessWidget {
  final MovieDetail movieDetail;
  const MovieDetailHeader({Key? key, required this.movieDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 120.0),
          child: ArcBannerImage(
              imageUrl:
                  "https://image.tmdb.org/t/p/w780${movieDetail.backdropPath}"),
        ),
        Positioned(
          bottom: 0.0,
          left: 16.0,
          right: 16.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Poster(
                posterUrl:
                    "https://image.tmdb.org/t/p/w500${movieDetail.posterPath}",
                height: 180.0,
              ),
              const SizedBox(width: 16.0),
              RatingInformation(
                movieDetail: movieDetail,
              )
            ],
          ),
        ),
      ],
    );
  }
}

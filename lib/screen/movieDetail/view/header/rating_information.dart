import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:watch_it/model/movie_detail.dart';

class RatingInformation extends StatelessWidget {
  final MovieDetail movieDetail;
  const RatingInformation({Key? key, required this.movieDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movieDetail.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            style: const TextStyle(fontSize: 22),
          ),
          Row(
            children: [
              Text(
                movieDetail.voteAverage.toString(),
                style: const TextStyle(color: Colors.amber, fontSize: 20),
              ),
              const SizedBox(width: 16.0),
              RatingBarIndicator(
                rating: movieDetail.voteAverage / 2,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 25.0,
                direction: Axis.horizontal,
              ),
            ],
          ),
          Text(
            "${movieDetail.voteCount} votes",
            style: TextStyle(color: Colors.deepOrange.shade300),
          ),
        ],
      ),
    );
  }
}

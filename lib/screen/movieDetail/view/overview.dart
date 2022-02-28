import 'package:flutter/material.dart';
import 'package:watch_it/model/movie_detail.dart';

class Overview extends StatelessWidget {
  final MovieDetail movieDetail;
  const Overview({Key? key, required this.movieDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Résumé",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 15),
          Text(movieDetail.overview),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}

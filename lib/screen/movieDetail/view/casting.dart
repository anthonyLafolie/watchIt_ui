import 'package:flutter/material.dart';
import 'package:watch_it/model/cast.dart';
import 'package:watch_it/model/movie_detail.dart';

class Casting extends StatelessWidget {
  final MovieDetail movieDetail;
  const Casting({Key? key, required this.movieDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Casting',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox.fromSize(
            size: const Size.fromHeight(120.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
                  movieDetail.cast.map((cast) => _buildActor(cast)).toList(),
            )),
      ],
    );
  }

  Widget _buildActor(Cast cast) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                "https://image.tmdb.org/t/p/w500${cast.profilePath}"),
            radius: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: SizedBox(
              width: 100.0,
              child: Text(
                cast.name,
                textAlign: TextAlign.center,
                textWidthBasis: TextWidthBasis.parent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

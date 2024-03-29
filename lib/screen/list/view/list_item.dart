import 'package:flutter/material.dart';
import 'package:watch_it/model/movie.dart';
import 'package:watch_it/screen/movieDetail/view/movie_detail_screen.dart';

class ListItem extends StatelessWidget {
  final Movie movie;
  const ListItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 4,
        height: 140,
        child: Image.network(
          "https://image.tmdb.org/t/p/w500${movie.posterPath}",
          fit: BoxFit.cover,
        ),
      ),
      onTap: () {
        Navigator.push(context, MovieDetailScreen.route(movie));
      },
    );
  }
}

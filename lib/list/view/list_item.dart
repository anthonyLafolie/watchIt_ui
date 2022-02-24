import 'package:flutter/material.dart';
import 'package:watch_it/model/movie.dart';

class ListItem extends StatelessWidget {
  final Movie movie;
  const ListItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 140,
      child: Image.network(
        "https://image.tmdb.org/t/p/w500${movie.posterPath}",
        fit: BoxFit.cover,
      ),
    );
  }
}

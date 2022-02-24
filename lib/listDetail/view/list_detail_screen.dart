import 'package:flutter/material.dart';
import 'package:watch_it/model/movie.dart';

class ListDetailScreen extends StatelessWidget {
  final List<Movie> movies;
  const ListDetailScreen({Key? key, required this.movies}) : super(key: key);

  static Route route(List<Movie> movies) {
    return MaterialPageRoute<void>(
        builder: (_) => ListDetailScreen(movies: movies));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Wrap(
          runSpacing: 5,
          spacing: 3,
          children: List.generate(
            movies.length,
            (index) => ListItem(movie: movies.elementAt(index)),
          ),
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final Movie movie;
  const ListItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://image.tmdb.org/t/p/w500${movie.posterPath}",
      fit: BoxFit.cover,
      height: 150,
      width: 100,
    );
  }
}

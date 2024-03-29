import 'package:watch_it/model/genre.dart';
import 'package:watch_it/model/cast.dart';

class MovieDetail {
  String title;
  String posterPath;
  String backdropPath;
  String overview;
  double voteAverage;
  int voteCount;
  List<Cast> cast;
  List<Genre> genre;

  MovieDetail(
      {required this.title,
      required this.posterPath,
      required this.backdropPath,
      required this.overview,
      required this.voteAverage,
      required this.voteCount,
      required this.cast,
      required this.genre});

  factory MovieDetail.fromJson(
      Map<dynamic, dynamic> parsedJson, List<Cast> cast) {
    return MovieDetail(
        title: parsedJson['title'],
        posterPath: parsedJson['poster_path'] ?? "",
        backdropPath: parsedJson['backdrop_path'] ?? "",
        overview: parsedJson['overview'] ?? "",
        voteAverage: parsedJson['vote_average'] ?? "",
        voteCount: parsedJson['vote_count'] ?? "",
        cast: cast,
        genre: genresFromJson(parsedJson['genres']));
  }
}

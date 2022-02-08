import 'dart:convert';

List<Movie> moviesFromJson(String str) =>
    List<Movie>.from(jsonDecode(str)["results"].map((x) {
      try {
        return Movie.fromJson(x);
      } catch (e) {
        return Movie(id: -999, title: "", posterPath: "", overview: "");
      }
    }))
      ..removeWhere((element) => element.id == -999);

class Movie {
  int id;
  String title;
  String posterPath;
  String overview;
  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  factory Movie.fromJson(Map<String, dynamic> parsedJson) {
    return Movie(
      id: parsedJson["id"],
      title: parsedJson['title'],
      posterPath: parsedJson['poster_path'],
      overview: parsedJson['overview'],
    );
  }
}

import 'dart:convert';

import 'package:equatable/equatable.dart';

List<Movie> tmdbmoviesFromJson(String str) =>
    List<Movie>.from(jsonDecode(str)["results"].map((x) {
      try {
        return Movie.fromJson(x);
      } catch (e) {
        return const Movie(id: -999, title: "", posterPath: "", overview: "");
      }
    }))
      ..removeWhere((element) => element.id == -999);

List<Movie> moviesFromJson(String str) {
  return List<Movie>.from(jsonDecode(str).map((x) {
    return Movie.fromJson(x);
  }));
}

class Movie extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  const Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
  });

  factory Movie.fromJson(Map<String, dynamic> parsedJson) {
    if (parsedJson["id"] != null) {
      return Movie(
        id: parsedJson["id"],
        title: parsedJson['title'],
        posterPath: parsedJson['poster_path'],
        overview: parsedJson['overview'],
      );
    }
    return Movie(
      id: parsedJson["idMovie"],
      title: parsedJson['title'],
      posterPath: parsedJson['posterPath'],
      overview: "",
    );
  }

  String toJson() => json.encode({
        "idMovie": id,
        "title": title,
        "posterPath": posterPath,
      });

  @override
  List<Object?> get props => [id, title, posterPath, overview];
}

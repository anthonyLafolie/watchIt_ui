import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:watch_it/model/filter_tmdb.dart';
import 'package:watch_it/model/movie.dart';

class TmdbService {
  final String apiKey = "9aed0fa917a9e58dab4d4f0e3736f214";
  final String baseUrl = "https://api.themoviedb.org/3";

  Future<List<FilterTmdb>> getFilters() async {
    return await http.get(
      Uri.parse("$baseUrl/genre/movie/list?api_key=$apiKey&language=fr-FR"),
      headers: {"Content-Type": "application/json"},
    ).then((value) => filtersTmdbFromJson(value.body));
  }

  // https://api.themoviedb.org/3/discover/movie?api_key=9aed0fa917a9e58dab4d4f0e3736f214&language=fr-FR&sort_by=release_date.desc
  Future<List<Movie>> discoverMoovie() async {
    String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return await http.get(
      Uri.parse(
          "$baseUrl/discover/movie?api_key=$apiKey&language=fr-FR&sort_by=release_date.desc&release_date.lte=$date"),
      headers: {"Content-Type": "application/json"},
    ).then((value) {
      List<Movie> movies = moviesFromJson(value.body);
      return movies;
    });
  }

  Future<List<Movie>> getMovies() async {
    List<Movie> movies = [];
    final tmdb = TMDB(ApiKeys('9aed0fa917a9e58dab4d4f0e3736f214',
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YWVkMGZhOTE3YTllNThkYWI0ZDRmMGUzNzM2ZjIxNCIsInN1YiI6IjYxZWVhYWIyZWEzN2UwNDk2ZDE4MDU1MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sjd6Wvwz5Ss8yWNMAFrsjuxgwXhmioeamra2-mlgmJQ'));
    for (var i = 1; i <= 10; i++) {
      movies.addAll(await tmdb.v3.discover
          .getMovies(language: "fr-FR", page: i)
          .then((value) => moviesFromJson(jsonEncode(value))));
    }
    return movies;
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:watch_it/common/constant.dart';
import 'package:watch_it/model/filter_tmdb.dart';
import 'package:watch_it/model/movie.dart';
import 'package:watch_it/service/lists_service.dart';

class TmdbService {
  final String apiKey = "9aed0fa917a9e58dab4d4f0e3736f214";
  final String baseUrl = "https://api.themoviedb.org/3";

  Future<List<FilterTmdb>> getFilters() async {
    return await http.get(
      Uri.parse("$baseUrl/genre/movie/list?api_key=$apiKey&language=fr-FR"),
      headers: {"Content-Type": "application/json"},
    ).then((value) => filtersTmdbFromJson(value.body));
  }

  Future<List<Movie>> discoverMovie() async {
    String date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return await http.get(
      Uri.parse(
          "$baseUrl/discover/movie?api_key=$apiKey&language=fr-FR&sort_by=release_date.desc&release_date.lte=$date"),
      headers: {"Content-Type": "application/json"},
    ).then((value) {
      List<Movie> movies = tmdbmoviesFromJson(value.body);
      return movies;
    });
  }

  Future<List<Movie>> getMovies() async {
    List<Movie> movies = [];
    for (var i = 1; i <= 5; i++) {
      movies.addAll(await tmdb.v3.discover
          .getMovies(language: "fr-FR", page: i)
          .then((value) => tmdbmoviesFromJson(jsonEncode(value))));
    }
    return removeMovies(movies);
  }

  Future<List<Movie>> removeMovies(List<Movie> movies) async {
    await ListsService().getWatchList().then((value) {
      for (Movie movie in value) {
        movies.removeWhere((element) => movie.id == element.id);
      }
    });
    await ListsService().getAlreadySeenList().then((value) {
      for (Movie movie in value) {
        movies.removeWhere((element) => movie.id == element.id);
      }
    });
    await ListsService().getDontWantSeenList().then((value) {
      for (Movie movie in value) {
        movies.removeWhere((element) => movie.id == element.id);
      }
    });
    return movies;
  }
}

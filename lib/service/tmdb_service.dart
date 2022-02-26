import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:watch_it/common/constant.dart';
import 'package:watch_it/model/cast.dart';
import 'package:watch_it/model/filter_tmdb.dart';
import 'package:watch_it/model/movie.dart';
import 'package:watch_it/model/movie_detail.dart';
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

  Future<List> getMovies(List<Movie> movies, int page, String? filter) async {
    List<Movie> moviesFetched = await tmdb.v3.discover
        .getMovies(language: "fr-FR", page: page, withGenres: filter)
        .then((value) => removeMovies(tmdbmoviesFromJson(jsonEncode(value))));
    if (moviesFetched.length < 10) {
      return getMovies(moviesFetched, page + 1, filter);
    } else {
      return [moviesFetched, page];
    }
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

  Future<MovieDetail> getMovieInfo(Movie movie) async {
    return await tmdb.v3.movies.getDetails(movie.id, language: "fr-FR").then(
        (detail) async => await tmdb.v3.movies.getCredits(movie.id).then(
            (cast) =>
                MovieDetail.fromJson(detail, castFromJson(jsonEncode(cast)))));
  }
}

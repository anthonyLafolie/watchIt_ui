import 'dart:convert';
import 'package:watch_it/common/constant.dart';
import 'package:http/http.dart' as http;
import 'package:watch_it/common/user_storage.dart';
import 'package:watch_it/model/movie.dart';

class ListsService {
  Future<List<Movie>> getWatchList() async {
    return UserStorage.getToken().then((token) async => await http.get(
          Uri.parse("${baseUrl}user/watchlist"),
          headers: {"Authorization": "Bearer $token"},
        ).then((value) => moviesFromJson(value.body)));
  }

  Future<List<Movie>> addMovieToWatchList(Movie movie) async {
    return UserStorage.getToken()
        .then((token) async => await http.post(Uri.parse("${baseUrl}watchlist"),
            headers: {
              "Authorization": "Bearer $token",
              "Content-Type": "application/json"
            },
            body: movie.toJson()))
        .then((value) => moviesFromJson(value.body));
  }

  Future<List<Movie>> getAlreadySeenList() async {
    return UserStorage.getToken().then((token) async => await http.get(
          Uri.parse("${baseUrl}user/alreadyseenlist"),
          headers: {"Authorization": "Bearer $token"},
        ).then((value) => moviesFromJson(value.body)));
  }

  Future<List<Movie>> addMovieToAlreadySeenList(Movie movie) async {
    return UserStorage.getToken()
        .then((token) async => await http.post(
            Uri.parse("${baseUrl}alreadyseenlist"),
            headers: {
              "Authorization": "Bearer $token",
              "Content-Type": "application/json"
            },
            body: movie.toJson()))
        .then((value) => moviesFromJson(value.body));
  }

  Future<List<Movie>> getDontWantSeenList() async {
    return UserStorage.getToken().then((token) async => await http.get(
          Uri.parse("${baseUrl}user/dontwantseenlist"),
          headers: {"Authorization": "Bearer $token"},
        ).then((value) => moviesFromJson(value.body)));
  }

  Future<List<Movie>> addMovieToDontWantSeenList(Movie movie) async {
    return UserStorage.getToken()
        .then((token) async => await http.post(
            Uri.parse("${baseUrl}dontwantseenlist"),
            headers: {
              "Authorization": "Bearer $token",
              "Content-Type": "application/json"
            },
            body: movie.toJson()))
        .then((value) => moviesFromJson(value.body));
  }
}

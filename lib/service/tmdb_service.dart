import 'package:http/http.dart' as http;
import 'package:watch_it/model/filter_tmdb.dart';

class TmdbService {
  Future<List<FilterTmdb>> getFilters() async {
    return await http.get(
      Uri.parse(
          "https://api.themoviedb.org/3/genre/movie/list?api_key=9aed0fa917a9e58dab4d4f0e3736f214&language=fr-FR"),
      headers: {"Content-Type": "application/json"},
    ).then((value) => filtersTmdbFromJson(value.body));
  }
}

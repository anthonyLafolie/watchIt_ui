import 'package:http/http.dart' as http;
import 'package:watch_it/common/constant.dart';
import 'package:watch_it/common/user_storage.dart';
import 'package:watch_it/model/filter.dart';
import 'package:watch_it/model/filter_tmdb.dart';
import 'package:watch_it/service/tmdb_service.dart';
import 'package:collection/collection.dart';

class FilterService {
  Future<List<FilterTmdb>> getFilters() async {
    return UserStorage.getToken().then(
      (token) async => await http.get(
        Uri.parse("${baseUrl}user/filters"),
        headers: {"Authorization": "Bearer $token"},
      ).then((value) async {
        List<Filter> filters = filtersFromJson(value.body);
        return await TmdbService().getFilters().then((tmdbFilters) {
          for (var filter in tmdbFilters) {
            filter.checked = filters.firstWhereOrNull((element) =>
                    element.name == filter.name && element.checked == true) !=
                null;
          }
          return tmdbFilters;
        });
      }),
    );
  }

  Future<http.Response> updateFilters(List<FilterTmdb> filtersTmdb) async {
    List<Filter> filters = filtersTmdbToFilter(filtersTmdb);
    return UserStorage.getToken().then((token) async => await http.post(
        Uri.parse("${baseUrl}filter"),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json"
        },
        body: filtersToJson(filters)));
  }
}

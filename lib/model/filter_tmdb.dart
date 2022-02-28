import 'dart:convert';

import 'package:watch_it/model/filter.dart';

List<FilterTmdb> filtersTmdbFromJson(String str) => List<FilterTmdb>.from(
    jsonDecode(str)["genres"].map((x) => FilterTmdb.fromJson(x)));

List<Filter> filtersTmdbToFilter(List<FilterTmdb> filters) => List<Filter>.from(
    filters.map((x) => Filter(name: x.name, checked: x.checked)));

class FilterTmdb {
  int id;
  String name;
  bool checked;

  @override
  String toString() {
    return "($id,$name,$checked)";
  }

  FilterTmdb({required this.id, required this.name, this.checked = false});

  factory FilterTmdb.fromJson(Map<String, dynamic> parsedJson) {
    return FilterTmdb(
      id: parsedJson["id"],
      name: parsedJson['name'],
    );
  }
}

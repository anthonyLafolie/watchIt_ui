import 'dart:convert';

List<Filter> filtersFromJson(String str) =>
    List<Filter>.from(jsonDecode(str).map((x) => Filter.fromJson(x)));

String filtersToJson(List<Filter> filters) =>
    json.encode(List<dynamic>.from(filters.map((x) => x.toJson())));

class Filter {
  String name;
  bool checked;

  @override
  String toString() {
    return "($name,$checked)";
  }

  Filter({
    required this.name,
    required this.checked,
  });

  factory Filter.fromJson(Map<String, dynamic> parsedJson) {
    return Filter(
      name: parsedJson["name"],
      checked: parsedJson['checked'],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "checked": checked,
      };
}

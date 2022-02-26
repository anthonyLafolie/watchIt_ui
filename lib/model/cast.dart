import 'dart:convert';

List<Cast> castFromJson(String str) {
  List<Cast> casting =
      List<Cast>.from(jsonDecode(str)["cast"].map((x) => Cast.fromJson(x)));
  casting.removeWhere((element) => element.profilePath == "");
  return casting.sublist(0, 3);
}

class Cast {
  String name;
  String profilePath;

  Cast({required this.name, required this.profilePath});

  factory Cast.fromJson(Map<String, dynamic> parsedJson) {
    return Cast(
      name: parsedJson['name'],
      profilePath: parsedJson['profile_path'] ?? "",
    );
  }
}

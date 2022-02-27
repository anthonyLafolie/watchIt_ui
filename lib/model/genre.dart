List<Genre> genresFromJson(List<dynamic> str) =>
    List<Genre>.from(str.map((x) => Genre.fromJson(x)));

class Genre {
  String name;

  Genre({
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> parsedJson) {
    return Genre(
      name: parsedJson["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

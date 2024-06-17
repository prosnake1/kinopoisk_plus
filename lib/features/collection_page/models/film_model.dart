class FilmModel {
  late String name;
  late String filmId;
  late String imageUrl;
  late int id;

  FilmModel(
      {required this.name,
      required this.filmId,
      required this.imageUrl,
      required this.id});
  static FilmModel fromMap(Map<String, dynamic> map) {
    return FilmModel(
      name: map['filmName'],
      filmId: map['filmId'],
      imageUrl: map['imageUrl'],
      id: map['id'],
    );
  }
}

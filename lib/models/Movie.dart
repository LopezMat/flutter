class Movie {
  String id;
  String title;
  String image;
  String description;
  String director;
  String release_date;

  Movie({required this.id, required this.title, required this.image, required this.description, required this.director, required this.release_date});

  // convertir le json en objet
  factory Movie.fromJson(Map<String, dynamic> parsedJson) {
    return Movie(
      id: parsedJson['id'],
      title: parsedJson['title'],
      image: parsedJson['image'],
      description: parsedJson['description'],
      director: parsedJson['director'],
      release_date: parsedJson['release_date']
    );
  }
}
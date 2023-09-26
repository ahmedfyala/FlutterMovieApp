import 'package:hive/hive.dart';

part 'movie_response.g.dart';

@HiveType(typeId: 0)
class MovieDitails extends HiveObject {
  @HiveField(0)
  bool? adult;
  @HiveField(1)
  String? idFirebase;
  @HiveField(2)
  bool isMarked;
  @HiveField(3)
  String backdrop_path;
  @HiveField(4)
  List<int>? genre_ids;
  @HiveField(5)
  int id;
  @HiveField(6)
  String overview;
  @HiveField(7)
  num? popularity;
  @HiveField(8)
  String poster_path;
  @HiveField(9)
  String release_date;
  @HiveField(10)
  String title;
  @HiveField(11)
  num? vote_average;
  @HiveField(12)
  num? vote_count;

  MovieDitails(
      {this.isMarked = true,
      this.idFirebase = '',
      required this.title,
      required this.id,
      required this.adult,
      required this.backdrop_path,
      required this.genre_ids,
      required this.overview,
      required this.popularity,
      required this.poster_path,
      required this.release_date,
      required this.vote_average,
      required this.vote_count});

  factory MovieDitails.fromJson(Map<String, dynamic> jsonData) {
    return MovieDitails(
        idFirebase: jsonData['idFirebase'],
        title: jsonData['title'] ?? 'UNKNOWN',
        id: jsonData['id'] ?? 'UNKNOWN',
        adult: jsonData['adult'] ?? 'UNKNOWN',
        backdrop_path: jsonData['backdrop_path'] ?? "",
        genre_ids: List<int>.from(jsonData['genre_ids']),
        // original_itle: jsonData['original_itle'],
        overview: jsonData['overview'] ?? 'UNKNOWN',
        popularity: jsonData['popularity'] ?? 'UNKNOWN',
        poster_path: jsonData['poster_path'] ?? 'UNKNOWN',
        release_date: jsonData['release_date'] ?? 'UNKNOWN',
        vote_average: jsonData['vote_average'] ?? 'UNKNOWN',
        vote_count: jsonData['vote_count'] ?? 'UNKNOWN');
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'id': id,
      'idFirebase': idFirebase,
      'adult': adult,
      'backdrop_path': backdrop_path,
      'genre_ids': genre_ids,
      'overview': overview,
      'popularity': popularity,
      'poster_path': poster_path,
      'release_date': release_date,
      'vote_average': vote_average,
      'vote_count': vote_count,
    };
  }
}

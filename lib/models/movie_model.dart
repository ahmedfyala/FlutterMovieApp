import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  int? id;
  List<int>? genreIds;
  String? title;
  String? backDropPath;
  String? orignalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  double? voteAverage;

  Movie({
    this.genreIds,
    this.id,
    this.title,
    this.backDropPath,
    this.orignalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["title"],
      backDropPath: json["backdrop_path"],
      orignalTitle: json["original_title"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      voteAverage:
          json["vote_average"] != null ? json["vote_average"].toDouble() : 0.0,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        backDropPath,
        genreIds,
        overview,
        voteAverage,
        releaseDate,
        orignalTitle,
        posterPath,
      ];
}

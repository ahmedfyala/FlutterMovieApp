// class SearchResponse {
//   int? page;
//   List<Results>? results;
//   int? totalPages;
//   int? totalResults;
//
//   SearchResponse({this.page, this.results, this.totalPages, this.totalResults});
//
//   SearchResponse.fromJson(Map<String, dynamic> json) {
//     page = json['page'];
//     if (json['results'] != null) {
//       results = <Results>[];
//       json['results'].forEach((v) {
//         results!.add(new Results.fromJson(v));
//       });
//     }
//     totalPages = json['total_pages'];
//     totalResults = json['total_results'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['page'] = this.page;
//     if (this.results != null) {
//       data['results'] = this.results!.map((v) => v.toJson()).toList();
//     }
//     data['total_pages'] = this.totalPages;
//     data['total_results'] = this.totalResults;
//     return data;
//   }
// }
//
// class Results {
//   bool? adult;
//   String? backdropPath;
//   List<int>? genreIds;
//   int? id;
//   String? originalLanguage;
//   String? originalTitle;
//   String? overview;
//   double? popularity;
//   String? posterPath;
//   String? releaseDate;
//   String? title;
//   bool? video;
//   double? voteAverage;
//   int? voteCount;
//
//   Results(
//       {this.adult,
//         this.backdropPath,
//         this.genreIds,
//         this.id,
//         this.originalLanguage,
//         this.originalTitle,
//         this.overview,
//         this.popularity,
//         this.posterPath,
//         this.releaseDate,
//         this.title,
//         this.video,
//         this.voteAverage,
//         this.voteCount});
//
//   Results.fromJson(Map<String, dynamic> json) {
//     adult = json['adult'];
//     backdropPath = json['backdrop_path'];
//     genreIds = json['genre_ids'].cast<int>();
//     id = json['id'];
//     originalLanguage = json['original_language'];
//     originalTitle = json['original_title'];
//     overview = json['overview'];
//     popularity = json['popularity'];
//     posterPath = json['poster_path'];
//     releaseDate = json['release_date'];
//     title = json['title'];
//     video = json['video'];
//     voteAverage = json['vote_average'];
//     voteCount = json['vote_count'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['adult'] = this.adult;
//     data['backdrop_path'] = this.backdropPath;
//     data['genre_ids'] = this.genreIds;
//     data['id'] = this.id;
//     data['original_language'] = this.originalLanguage;
//     data['original_title'] = this.originalTitle;
//     data['overview'] = this.overview;
//     data['popularity'] = this.popularity;
//     data['poster_path'] = this.posterPath;
//     data['release_date'] = this.releaseDate;
//     data['title'] = this.title;
//     data['video'] = this.video;
//     data['vote_average'] = this.voteAverage;
//     data['vote_count'] = this.voteCount;
//     return data;
//   }
// }
class SearchResponse {
  bool? adult;
  String? idFirebase;
  bool isMarked;
  String backdrop_path;
  List<int>? genre_ids;
  int id;
  String overview;
  num? popularity;
  String poster_path;
  String release_date;
  String title;
  num? vote_average;
  num? vote_count;

  SearchResponse(
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

  factory SearchResponse.fromJson(Map<String, dynamic> jsonData) {
    return SearchResponse(
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

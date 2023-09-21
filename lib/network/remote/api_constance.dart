class ApiConstance {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String api_key = "229c83183b45c4a3cae8c6ca8b7cefbb";
  static const String base_image = 'https://image.tmdb.org/t/p/w500';

  static const trendingUrl = '${baseUrl}/trending/movie/day?api_key=${api_key}';
  static const latestUrl =
      'https://api.themoviedb.org/3/movie/latest?api_key=${api_key}';

  static const popularUrl = '${baseUrl}/movie/popular?api_key=${api_key}';

  static const topratedUrl = '${baseUrl}/movie/top_rated?api_key=${api_key}';

  static const upcomingUrl = '${baseUrl}/movie/upcoming?api_key=${api_key}';

  static const String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=$api_key";

  static String movieDetailsPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$api_key";

  static String recommendationPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$api_key";

  static String imageUrl(String path) => '$base_image$path';
}

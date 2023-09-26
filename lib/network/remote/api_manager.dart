import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/network/remote/api_constance.dart';
import '../../models/movie_response.dart';
import '../../models/catigory_model.dart';

class ApiManager {
  static Future<MovieDitails> getSearchMovies({String? searchKeyword}) async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/search/movie?query=$searchKeyword&api_key=229c83183b45c4a3cae8c6ca8b7cefbb');
    // https('api.themoviedb.org', "/3/search/movie", {
    //   "apiKey": ApiConstance.api_key,
    //   "query": searchKeyword,
    // });
    var response = await http.get(url);
    //print(response.body);
    // if (response.statusCode == 200) {
    var jsonData = jsonDecode(response.body);
    // print(response.statusCode);
    MovieDitails movieDataModel = MovieDitails.fromJson(jsonData);
    //print('movieDataModel-------------------------$movieDataModel');
    return movieDataModel;
    //} else {
    //   print('API Error: ${response.statusCode} - ${response.reasonPhrase}');
    //   throw Exception('Failed to load search results');
    // }
  }

  static Future<List<MovieDitails>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(ApiConstance.trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => MovieDitails.fromJson(movie)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  static Future<List<MovieDitails>> getLatestMovie() async {
    final response = await http.get(Uri.parse(ApiConstance.latestUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => MovieDitails.fromJson(movie)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  static Future<List<MovieDitails>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(ApiConstance.topratedUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => MovieDitails.fromJson(movie)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  static Future<List<MovieDitails>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(ApiConstance.upcomingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => MovieDitails.fromJson(movie)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  static Future<List<MovieDitails>> getPopularMovies() async {
    final response = await http.get(Uri.parse(ApiConstance.popularUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      final List<MovieDitails> searchResponses =
          (decodedData['results'] as List)
              .map((json) => MovieDitails.fromJson(json))
              .toList();
      print(
          'API Response Data: $searchResponses'); // Add this line for debugging
      return searchResponses;
    } else {
      print('API Error: ${response.statusCode} - ${response.reasonPhrase}');
      throw Exception('Something went wrong');
    }
  }

  static Future<List<MovieDitails>> fetchDataFromSearch(String query) async {
    var response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?query=$query&api_key=${ApiConstance.api_key}'));
    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body)['results'];
      return json.map((json) => MovieDitails.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }

  static Future<List<MovieDitails>> getSimilarMovies(int movie_id) async {
    var response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/${movie_id}/similar?api_key=${ApiConstance.api_key}'));
    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body)['results'];
      return json.map((json) => MovieDitails.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }

  static Future<List<MovieDitails>> fetchCategoryMovies(
      {required int id}) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?with_genres=$id&api_key=${ApiConstance.api_key}'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body)['results'];
      //print("--------------------------------${response.body}");
      return jsonList.map((json) => MovieDitails.fromJson(json)).toList();
    } else {
      throw response.statusCode;
    }
  }

  static Future<List<CategoryNameModel>> fetchCategoryName() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/genre/movie/list?api_key=${ApiConstance.api_key}'));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body)['genres'];
      return jsonList.map((json) => CategoryNameModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}

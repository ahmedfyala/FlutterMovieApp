import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/network/remote/api_constance.dart';
import '../../models/SearchResponse.dart';
import '../../models/catigory_model.dart';

class ApiManager {
  // static Future<Movie> getSearchMovies(
  //     {String? searchKeyword}) async {
  //   Uri url = Uri.https('api.themoviedb.org', "/3/search/movie", {
  //     "query": searchKeyword,
  //     "apiKey":ApiConstance.api_key,
  //
  //   });
  //  // http.get(url);
  //   var response = await http.get(url);
  //   var jsonData = jsonDecode(response.body);
  //   Movie newsDataModel = Movie.fromJson(jsonData);
  //   return newsDataModel;
  // }
//'https://api.themoviedb.org/3/search/movie?query=Jack+Reacher&api_key=229c83183b45c4a3cae8c6ca8b7cefbb'
  static Future<SearchResponse> getSearchMovies({String? searchKeyword}) async {
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
    SearchResponse movieDataModel = SearchResponse.fromJson(jsonData);
    //print('movieDataModel-------------------------$movieDataModel');
    return movieDataModel;
    //} else {
    //   print('API Error: ${response.statusCode} - ${response.reasonPhrase}');
    //   throw Exception('Failed to load search results');
    // }
  }

  static Future<List<SearchResponse>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(ApiConstance.trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData
          .map((movie) => SearchResponse.fromJson(movie))
          .toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  static Future<List<SearchResponse>> getLatestMovie() async {
    final response = await http.get(Uri.parse(ApiConstance.latestUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData
          .map((movie) => SearchResponse.fromJson(movie))
          .toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  static Future<List<SearchResponse>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(ApiConstance.topratedUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData
          .map((movie) => SearchResponse.fromJson(movie))
          .toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  static Future<List<SearchResponse>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(ApiConstance.upcomingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData
          .map((movie) => SearchResponse.fromJson(movie))
          .toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  // static Future<List<SearchResponse>> getPopularMovies() async {
  //   final response = await http.get(Uri.parse(ApiConstance.popularUrl));
  //   if (response.statusCode == 200) {
  //     final decodedData = json.decode(response.body)['results'] as List;
  //     return decodedData.map((movie) => Movie.fromJson(movie)).toList();
  //   } else {
  //     throw Exception('Something went wrong');
  //   }
  // }

  // static Future<List<SearchResponse>> getPopularMovies() async {
  //   final response = await http.get(Uri.parse(ApiConstance.popularUrl));
  //   if (response.statusCode == 200) {
  //     final decodedData = json.decode(response.body);
  //     final List<SearchResponse> searchResponses = (decodedData['results'] as List)
  //         .map((json) => SearchResponse.fromJson(json))
  //         .toList();
  //     print('--------------------------------$response.body');
  //     return searchResponses;
  //   } else {
  //     throw Exception('Something went wrong');
  //   }
  // }

  // static Future<List<Results>> getPopularMovies() async {
  //   final response = await http.get(Uri.parse(ApiConstance.popularUrl));
  //   if (response.statusCode == 200) {
  //     final decodedData = json.decode(response.body)['results'] as List;
  //     print('-----------------------------------------------------------$response.body');
  //     return decodedData.map((movie) => Results.fromJson(movie)).toList();
  //
  //   } else {
  //     throw Exception('Something went wrong');
  //   }
  // }

  static Future<List<SearchResponse>> getPopularMovies() async {
    final response = await http.get(Uri.parse(ApiConstance.popularUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      final List<SearchResponse> searchResponses =
          (decodedData['results'] as List)
              .map((json) => SearchResponse.fromJson(json))
              .toList();
      print(
          'API Response Data: $searchResponses'); // Add this line for debugging
      return searchResponses;
      // print("--------------------------------$response.body");
    } else {
      print('API Error: ${response.statusCode} - ${response.reasonPhrase}');
      throw Exception('Something went wrong');
    }
  }

  static Future<List<SearchResponse>> fetchDataFromSearch(String query) async {
    var response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?query=$query&api_key=${ApiConstance.api_key}'));
    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body)['results'];
      return json.map((json) => SearchResponse.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }

  Future<List<CategoryNameModel>> fetchCategoryName(String api) async {
    final response = await http.get(Uri.parse(api));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body)['genres'];
      return jsonList.map((json) => CategoryNameModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }

// static Future<List<Recommendation>> getRecommendationMovies(int id) async {
//    final response = await http.get(Uri.parse(ApiConstance.recommendationPath(id)));
//    if (response.statusCode == 200) {
//      final decodedData = json.decode(response.body)['results'] as List;
//      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
//    } else {
//      throw Exception('Something went wrong');
//    }
//  }
}

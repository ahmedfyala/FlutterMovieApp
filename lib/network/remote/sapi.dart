import 'dart:convert';

import 'package:movies_app/network/remote/api_constance.dart';

import '../../models/series.dart';
import 'package:http/http.dart' as http;


class SApi {
  static const _trendingSeriesUrl =
      'https://api.themoviedb.org/3/trending/tv/day?api_key=${ApiConstance.api_key}';

  static const _topRatedSeriesUrl =
      'https://api.themoviedb.org/3/tv/top_rated?api_key=${ApiConstance.api_key}';

  static const _popularSeriesUrl =
      'https://api.themoviedb.org/3/tv/popular?api_key=${ApiConstance.api_key}';

  Future<List<Series>> getTrendingSeries() async {
    final response = await http.get(Uri.parse(_trendingSeriesUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((series) => Series.fromJson(series)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<Series>> getTopRatedSeries() async {
    final response = await http.get(Uri.parse(_topRatedSeriesUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((series) => Series.fromJson(series)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }

  Future<List<Series>> getPopularSeries() async {
    final response = await http.get(Uri.parse(_popularSeriesUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((series) => Series.fromJson(series)).toList();
    } else {
      throw Exception('Something went wrong');
    }
  }
}

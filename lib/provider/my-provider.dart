import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/movie_response.dart';

class MyProviderApp extends ChangeNotifier {
  List<MovieDitails> watchlist = [];
  bool isClicked = false;

  bool isMovieInWatchlist(MovieDitails movie) {
    return watchlist.contains(movie);
  }

  Future<void> addToWatchlist(MovieDitails movie) async {
    try {
      var movieBox = Hive.box<MovieDitails>('movie_box');
      await movieBox.add(movie);
    } on Exception catch (e) {}

    watchlist.add(movie);

    notifyListeners();
  }

  void removeFromWatchlist(MovieDitails movie) {
    watchlist.remove(movie);
    notifyListeners();
  }
}

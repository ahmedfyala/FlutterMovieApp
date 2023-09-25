import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../models/movie_response.dart';

class MyProviderApp extends ChangeNotifier {
  List<MovieDitails> watchlist = [];
  bool isClicked = false;

  bool isMovieInWatchlist(MovieDitails movie) {
    return watchlist.contains(movie);
  }

  void addToWatchlist(MovieDitails movie) {
    watchlist.add(movie);
    notifyListeners();
  }

  void removeFromWatchlist(MovieDitails movie) {
    watchlist.remove(movie);
    notifyListeners();
  }
// void getdatatoadd() {
//   isClicked = true;
//   Movie movies;
//   notifyListeners();
// }
}

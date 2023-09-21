import 'package:flutter/material.dart';

import '../models/SearchResponse.dart';
import '../models/movie_model.dart';

class MyProviderApp extends ChangeNotifier {
  List<SearchResponse> watchlist = [];
  bool isClicked = false;

  bool isMovieInWatchlist(SearchResponse movie) {
    return watchlist.contains(movie);
  }

  void addToWatchlist(SearchResponse movie) {
    watchlist.add(movie);
    notifyListeners();
  }

  void removeFromWatchlist(SearchResponse movie) {
    watchlist.remove(movie);
    notifyListeners();
  }
// void getdatatoadd() {
//   isClicked = true;
//   Movie movies;
//   notifyListeners();
// }
}

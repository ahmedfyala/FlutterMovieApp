import 'package:flutter/material.dart';
import 'package:movies_app/core/style/my_theme.dart';
import 'package:movies_app/search_widget.dart';

import 'models/movie_model.dart';

class SearchScreen extends StatelessWidget {
  List<Movie>? Movies;
  Movie? Movies2;

  SearchScreen({this.Movies, this.Movies2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyThemeData.oBlack,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: MoviesSearch(Movies2: Movies2),
              );
            },
          ),
        ],
        title: Text('Search Movies'),
      ),
      body: Center(
        child: Image.asset('assets/images/no_movies.png'),
      ),
    );
  }
}

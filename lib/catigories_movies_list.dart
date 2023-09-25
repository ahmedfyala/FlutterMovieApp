import 'package:flutter/material.dart';
import 'package:movies_app/componants/latest_movies_componant.dart';
import 'package:movies_app/componants/new_release_componant.dart';
import 'package:movies_app/models/catigory_model.dart';

import 'componants/result_search_componant.dart';
import 'models/movie_response.dart';
import 'network/remote/api_manager.dart';

class CategoriesMovieList extends StatefulWidget {
  const CategoriesMovieList({super.key, required this.getCategoryNameModel});

  final CategoryNameModel getCategoryNameModel;

  @override
  State<CategoriesMovieList> createState() => _CategoriesMovieListState();
}

late Future<List<MovieDitails>> myMovies;

class _CategoriesMovieListState extends State<CategoriesMovieList> {
  void initState() {
    super.initState();
    myMovies = ApiManager.fetchCategoryMovies(
        id: widget.getCategoryNameModel.categoryId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.getCategoryNameModel.categoryName!),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<MovieDitails>>(
              future: myMovies,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return Text(
                      'No data available'); // Handle case where data is null
                } else {
                  // print(snapshot.data);
                  List<MovieDitails>? movies = snapshot.data;
                  print(movies!.length);
                  return Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 0,
                            mainAxisSpacing: 0,
                            crossAxisCount: 2,
                          ),
                          shrinkWrap: true,
                          itemCount: movies.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) => NewRelease(
                                movies[index],
                              )));
                }
                // itemCount: movies!.length,
              },
            ),
          ),
        ],
      ),
    );
  }
}

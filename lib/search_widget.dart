import 'package:flutter/material.dart';
import '../../network/remote/api_manager.dart';
import 'componants/result_search_componant.dart';
import 'models/movie_response.dart';

class MoviesSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: Icon(Icons.search),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.clear,
        size: 32,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<MovieDitails>>(
      // Change the generic type
      future: ApiManager.fetchDataFromSearch(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Something went wrong"));
        }
        List<MovieDitails>? movies = snapshot.data as List<MovieDitails>;
        print("Snapshot data: ${snapshot.data}");

        return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return ResultSearchWidget(movie: movies[index]);
          },
        );
      },
    );

    //   FutureBuilder<List<SearchResponse>>(
    //   future: ApiManager.fetchDataFromSearch(query),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Center(child: CircularProgressIndicator());
    //     }
    //     if (snapshot.hasError) {
    //       print("Error: ${snapshot.error}");
    //       return Center(child: Text("Error: ${snapshot.error}"));
    //     }
    //     final searchResult = snapshot.data;
    //
    //     if (searchResult != null) {
    //       // print('searchResul${searchResult?.results??""}');
    //       return ResultSearchWidget(searchResponse: searchResult);
    //
    //     } else {
    //       return Center(child: Text("No results found"));
    //     }
    //   },
    // );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('xd'),
    );
  }
}

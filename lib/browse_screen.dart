import 'package:flutter/material.dart';
import 'package:movies_app/network/remote/api_constance.dart';
import 'package:movies_app/network/remote/api_manager.dart';

import 'catigories_movies_list.dart';
import 'models/movie_response.dart';
import 'models/catigory_model.dart';
import 'models/series.dart';

class BrowseScreen extends StatefulWidget {
  static const String routeName = 'browse';

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

CategoryNameModel? category;

class _BrowseScreenState extends State<BrowseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('categories'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<CategoryNameModel>>(
        future: ApiManager.fetchCategoryName(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData) {
            return Text('No data available'); // Handle case where data is null
          } else {
            // print(snapshot.data);
            List<CategoryNameModel>? movies = snapshot.data;
            // Continue building your widget using 'movies'
            return Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return CategoriesMovieList(
                          getCategoryNameModel: movies[index],
                        );
                      },
                    ));
                  },
                  child: Container(
                    width: 160,
                    height: 85,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        movies[index].categoryName!,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                itemCount: movies!.length,
              ),
            );
          }
        },
      ),
    );
  }
}

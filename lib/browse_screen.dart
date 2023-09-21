import 'package:flutter/material.dart';
import 'package:movies_app/network/remote/api_constance.dart';
import 'package:movies_app/network/remote/api_manager.dart';

import 'models/SearchResponse.dart';
import 'models/series.dart';

class BrowseScreen extends StatefulWidget {
  static const String routeName = 'browse';

  // final Results allResults;
  //
  //  BrowseScreen(this.allResults);
  BrowseScreen({
    this.series,
  });

  Series? series;

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 340.0,
            child: FutureBuilder<List<SearchResponse>>(
              // Change the generic type
              future: ApiManager.fetchDataFromSearch(query),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Something went wrong"));
                }
                List<SearchResponse>? movies =
                    snapshot.data as List<SearchResponse>;
                print("Snapshot data: ${snapshot.data}");

                return CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 340.0,
                    autoPlay: true,
                  ),
                  itemCount: movies.length,
                  itemBuilder: (context, itemIndex, realIndex) {
                    //print("Snapshot data: ${snapshot.data}");
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NowPlayingWidget(Movies: movies[itemIndex]),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/componants/now_playing_componant.dart';
import 'package:movies_app/network/remote/api_manager.dart';

import 'componants/latest_movies_componant.dart';
import 'componants/new_release_componant.dart';
import 'componants/section_title.dart';
import 'models/SearchResponse.dart';
import 'models/movie_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.Movies});

  SearchResponse? Movies;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color darkGray = Color(0xFF282A28);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Container(
            //   height: 340,
            //   child: Stack(
            //     children: [
            //       Container(
            //           width: 412,
            //           height: 217,
            //           child: Image.asset('assets/images/Image.png')),
            //       Positioned(
            //         bottom: 40,
            //         child: Container(
            //             height: 199,
            //             width: 129,
            //             child: Wrap(
            //               spacing: 8.0, // gap between adjacent chips
            //               runSpacing: 4.0, // gap between lines
            //               direction: Axis.vertical,
            //               children: [
            //                 Row(
            //                   children: [
            //                     Stack(
            //                       children: [
            //                         ClipRRect(
            //                             borderRadius: BorderRadius.circular(13),
            //                             child: Image.asset(
            //                                 'assets/images/Image2.png')),
            //                         Container(
            //                           height: 40,
            //                           child: Stack(
            //                             alignment: Alignment.center,
            //                             children: [
            //                               Icon(
            //                                 Icons.bookmark,
            //                                 size: 40,
            //                                 color: Color(0xFF514F4F),
            //                               ),
            //                               Icon(
            //                                 Icons.add,
            //                                 color: Colors.white,
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                     Padding(
            //                       padding: const EdgeInsets.all(8.0),
            //                       child: Column(
            //                         mainAxisAlignment: MainAxisAlignment.center,
            //                         children: [
            //                           SizedBox(
            //                             height: 85,
            //                           ),
            //                           Padding(
            //                             padding: const EdgeInsets.all(8.0),
            //                             child: Text(
            //                               'Dora and the lost city of gold',
            //                               style: TextStyle(color: Colors.white),
            //                             ),
            //                           ),
            //                           Padding(
            //                             padding: const EdgeInsets.all(8.0),
            //                             child: Text(
            //                               'Dora and the lost city of gold',
            //                               style: TextStyle(color: Colors.white),
            //                             ),
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ],
            //             )),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              height: 340.0,
              child: FutureBuilder<List<SearchResponse>>(
                // Change the generic type
                future: ApiManager.getPopularMovies(),
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
            // Container(
            //   height: 340.0,
            //   child: FutureBuilder<List<SearchResponse>>(
            //     future: ApiManager.getPopularMovies(),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return Center(child: CircularProgressIndicator());
            //       }
            //       if (snapshot.hasError) {
            //         return Center(child: Text("Something went wrong"));
            //       }
            //
            //       List<SearchResponse>? movies = snapshot.data;
            //
            //       if (movies == null || movies.isEmpty) {
            //         return Center(child: Text("No data available"));
            //       }
            //
            //       return CarouselSlider.builder(
            //         options: CarouselOptions(
            //           height: 340.0,
            //           autoPlay: true,
            //         ),
            //         itemCount: movies.length,
            //         itemBuilder: (context, itemIndex, realIndex) {
            //           return Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: NowPlayingWidget(Movies: movies[itemIndex]),
            //           );
            //         },
            //       );
            //     },
            //   ),
            // ),

            SectionTitle('Top Rated'),
            Container(
              color: darkGray,
              height: 170.0,
              child: FutureBuilder(
                future: ApiManager.getTopRatedMovies(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Something went wrong"));
                  }
                  var movies = snapshot.data as List<SearchResponse>;

                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      return NewRelease(movies[index]);
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SectionTitle('Upcoming Movies'),
            Container(
              color: darkGray,
              height: 250.0,
              width: 450,
              child: FutureBuilder(
                future: ApiManager.getUpcomingMovies(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Something went wrong"));
                  }
                  var movies = snapshot.data as List<SearchResponse>;

                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      return LatestMovies(
                        Movies: movies[index],
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SectionTitle('getTrendingMovies'),
            Container(
              color: darkGray,
              height: 250.0,
              width: 450,
              child: FutureBuilder(
                future: ApiManager.getTrendingMovies(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Something went wrong"));
                  }
                  var movies = snapshot.data as List<SearchResponse>;

                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      return LatestMovies(
                        Movies: movies[index],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

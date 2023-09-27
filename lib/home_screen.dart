import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/componants/now_playing_componant.dart';
import 'package:movies_app/network/remote/api_manager.dart';

import 'componants/latest_movies_componant.dart';
import 'componants/new_release_componant.dart';
import 'componants/section_title.dart';
import 'models/movie_response.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.Movies});

  MovieDitails? Movies;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
late Future<List<MovieDitails>> pepular;
late Future<List<MovieDitails>> topRated;
late Future<List<MovieDitails>> upcoming;
late Future<List<MovieDitails>> trending;

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    super.initState();
    pepular = ApiManager.getPopularMovies();
    topRated = ApiManager.getTopRatedMovies();
    upcoming = ApiManager.getUpcomingMovies();
    trending = ApiManager.getTrendingMovies();
  }
  Color darkGray = Color(0xFF282A28);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 300.0.h,
              child: FutureBuilder<List<MovieDitails>>(
                // Change the generic type
                future: pepular,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Something went wrong"));
                  }
                  List<MovieDitails>? movies =
                      snapshot.data as List<MovieDitails>;
                  print("Snapshot data: ${snapshot.data}");

                  return CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 340.0.h,
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
            SectionTitle('Top Rated'),
            Container(
              color: darkGray,
              height: 140.0.h,
              child: FutureBuilder(
                future: topRated,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Something went wrong"));
                  }
                  var movies = snapshot.data as List<MovieDitails>;

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
              height: 220.0.h,
              width: 450.w,
              child: FutureBuilder(
                future: upcoming,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Something went wrong"));
                  }
                  var movies = snapshot.data as List<MovieDitails>;

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
            SectionTitle('Trending Movies'),
            Container(
              color: darkGray,
              height: 220.0.h,
              width: 450.w,
              child: FutureBuilder(
                future: trending,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Something went wrong"));
                  }
                  var movies = snapshot.data as List<MovieDitails>;

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

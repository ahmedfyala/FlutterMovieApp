import 'package:flutter/material.dart';
import 'package:movies_app/network/remote/api_constance.dart';
import 'package:provider/provider.dart';

import '../Veiw_movie_ditails_screen.dart';
import '../models/SearchResponse.dart';
import '../models/movie_model.dart';
import '../provider/my-provider.dart';
import 'bookMark_componant.dart';

class NowPlayingWidget extends StatelessWidget {
  SearchResponse? Movies;

  NowPlayingWidget({this.Movies});

  @override
  Widget build(BuildContext context) {
    print("Movies: $Movies");
    var provider = Provider.of<MyProviderApp>(context);
    bool isInWatchlist = provider.watchlist.contains(Movies);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return VeiwMovieDitails(Movies!);
          },
        ));
      },
      child: Container(
        height: 340,
        child: Stack(
          children: [
            Container(
                width: 412,
                height: 217,
                child: Image.network(
                  '${ApiConstance.base_image}${Movies?.backdrop_path ?? ""}',
                  // ApiConstance.imageUrl(Movies!.posterPath ?? "")
                )),
            Positioned(
              bottom: 40,
              child: Container(
                  height: 169,
                  width: 119,
                  child: Wrap(
                    spacing: 8.0, // gap between adjacent chips
                    runSpacing: 4.0, // gap between lines
                    direction: Axis.vertical,
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(13),
                                  child: Image.network(
                                    '${ApiConstance.base_image}${Movies?.poster_path ?? ""}',
                                    fit: BoxFit.fill,
                                  )),
                              BookMarkWidget(
                                Movies!,
                                (p0) {
                                  // Check if the movie is in the watchlist
                                  final isInWatchlist =
                                      provider.isMovieInWatchlist(Movies!);

                                  if (isInWatchlist) {
                                    // Remove the movie from the watchlist
                                    provider.removeFromWatchlist(Movies!);
                                  } else {
                                    // Add the movie to the watchlist
                                    provider.addToWatchlist(Movies!);
                                  }
                                },
                                //isInWatchlist, // Pass whether it's in the watchlist
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 85,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    Movies?.title ?? "",
                                    maxLines: 2,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    child: Text(
                                      Movies?.title ?? "",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

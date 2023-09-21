import 'package:flutter/material.dart';
import 'package:movies_app/componants/bookMark_componant.dart';
import 'package:movies_app/network/remote/api_constance.dart';
import 'package:provider/provider.dart';

import '../Veiw_movie_ditails_screen.dart';
import '../models/SearchResponse.dart';
import '../models/movie_model.dart';
import '../network/remote/api_manager.dart';
import '../provider/my-provider.dart';

class LatestMovies extends StatelessWidget {
  SearchResponse? Movies;

  LatestMovies({this.Movies});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProviderApp>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return VeiwMovieDitails(Movies!);
          },
        ));
      },
      child: Card(
        color: Color(0XFF282A28),
        borderOnForeground: false,
        surfaceTintColor: Colors.transparent,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(11),
        ),
        elevation: 11.4,
        child: SingleChildScrollView(
          child: Container(
            // height: 170,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: Color(0XFF282A28),
            ),
            child: Column(
              //mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    topLeft: Radius.circular(8.0),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8.0),
                          topLeft: Radius.circular(8.0),
                        ),
                        child: Image.network(
                          '${ApiConstance.base_image}${Movies?.poster_path ?? ""}',
                        ),
                      ),
                      BookMarkWidget(Movies!, (p0) {
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
                      }),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(Movies!.title ?? ""),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        Movies!.title ?? "",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 14),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            Movies!.title ?? "",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 11, color: Color(0xFFB5B4B4)),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      // Align(
                      //     alignment:
                      //     Alignment.topLeft,
                      //     child: Text(
                      //       Movies.,
                      //       textAlign:
                      //       TextAlign.start,
                      //       style: TextStyle(
                      //           fontSize: 11,
                      //           color: Color(
                      //               0xFFB5B4B4)),
                      //     )),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      // Align(
                      //     alignment:
                      //     Alignment.topLeft,
                      //     child: Text(
                      //       Movies.,
                      //       textAlign:
                      //       TextAlign.start,
                      //       style: TextStyle(
                      //           fontSize: 11,
                      //           color: Color(
                      //               0xFFB5B4B4)),
                      //     )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

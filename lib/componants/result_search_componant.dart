import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/SearchResponse.dart';
import '../provider/my-provider.dart';
import 'bookMark_componant.dart';

class ResultSearchWidget extends StatelessWidget {
  SearchResponse? searchResponse;

  //Movie? Movies;
  ResultSearchWidget({this.searchResponse});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProviderApp>(context);
    return Container(
      width: 358,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Container(
                      height: 91,
                      width: 141,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Center(
                              child: Image.network(
                            'https://image.tmdb.org/t/p/original${searchResponse?.backdrop_path}',
                          )))),
                  BookMarkWidget(
                    searchResponse!,
                    (p0) {
                      // Check if the movie is in the watchlist
                      final isInWatchlist =
                          provider.isMovieInWatchlist(searchResponse!);

                      if (isInWatchlist) {
                        // Remove the movie from the watchlist
                        provider.removeFromWatchlist(searchResponse!);
                      } else {
                        // Add the movie to the watchlist
                        provider.addToWatchlist(searchResponse!);
                      }
                    },
                    //isInWatchlist, // Pass whether it's in the watchlist
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      searchResponse?.title ?? "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                    SizedBox(height: 8),
                    Text(
                      searchResponse?.release_date ?? "",
                      style: GoogleFonts.poppins(
                          fontSize: 10, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 25,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      searchResponse!.vote_average.toString().substring(0, 3) ??
                          "",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 0.3,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

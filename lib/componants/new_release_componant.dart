import 'package:flutter/material.dart';
import 'package:movies_app/network/remote/api_constance.dart';
import 'package:provider/provider.dart';

import '../Veiw_movie_ditails_screen.dart';
import '../models/SearchResponse.dart';
import '../models/movie_model.dart';
import '../network/remote/api_manager.dart';
import '../provider/my-provider.dart';
import 'bookMark_componant.dart';

class NewRelease extends StatelessWidget {
  SearchResponse Movies;

  NewRelease(this.Movies);

  //color:  Color(0XFF282A28),
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProviderApp>(context);
    return Container(
      padding: const EdgeInsets.only(right: 1.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return VeiwMovieDitails(Movies!);
            },
          ));
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),
          child: Card(
            borderOnForeground: false,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
            ),
            color: Colors.transparent,
            child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: Image.network(
                        '${ApiConstance.base_image}${Movies!.poster_path ?? ""}')),
                BookMarkWidget(Movies!, (p0) {
                  // Check if the movie is in the watchlist
                  final isInWatchlist = provider.isMovieInWatchlist(Movies!);

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
        ),
      ),
    );
  }
}

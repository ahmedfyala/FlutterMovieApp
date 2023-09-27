import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/network/remote/api_constance.dart';
import 'package:provider/provider.dart';

import '../Veiw_movie_ditails_screen.dart';
import '../models/movie_response.dart';
import '../network/remote/api_manager.dart';
import '../provider/my-provider.dart';
import 'bookMark_componant.dart';

class NewRelease extends StatelessWidget {
  MovieDitails? Movies;

  NewRelease(this.Movies);

  //color:  Color(0XFF282A28),
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
      child: Container(
        width: 110.w,
        height: 160.h,
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
                child: CachedNetworkImage(
                  progressIndicatorBuilder: (context, url, progress) => Center(
                    child: CircularProgressIndicator(
                      value: progress.progress,
                    ),
                  ),
                  imageUrl:
                      '${ApiConstance.base_image}${Movies!.poster_path ?? ""}',
                  fit: BoxFit.cover,
                  width: 110.w,
                  height: 160.h,
                  errorWidget: (context, url, error) => Image.network(
                    'https://moviereelist.com/wp-content/uploads/2019/07/poster-placeholder.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                // Image.network(
                //   '${ApiConstance.base_image}${Movies!.poster_path ?? ""}',
                //   fit: BoxFit.fill,
                //   width: 110,
                //   height: 160,
                // )
              ),
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
    );
  }
}

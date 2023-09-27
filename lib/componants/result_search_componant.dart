import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Veiw_movie_ditails_screen.dart';
import '../models/movie_response.dart';
import '../network/remote/api_constance.dart';
import '../provider/my-provider.dart';
import 'bookMark_componant.dart';

class ResultSearchWidget extends StatelessWidget {
  MovieDitails? movie;

  ResultSearchWidget({super.key, this.movie});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProviderApp>(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return VeiwMovieDitails(movie!);
          },
        ));
      },
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                        height: 75.h,
                        width: 135.w,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: Center(
                              child: CachedNetworkImage(
                                progressIndicatorBuilder:
                                    (context, url, progress) => Center(
                                  child: CircularProgressIndicator(
                                    value: progress.progress,
                                  ),
                                ),
                                imageUrl: ApiConstance.imageUrl(
                                    movie?.backdrop_path ?? ""),
                                fit: BoxFit.fitWidth,
                                errorWidget: (context, url, error) =>
                                    Image.network(
                                  'https://rigginspainting.com/wp-content/uploads/2015/08/video-player-placeholder-very-large.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ))),
                    BookMarkWidget(
                      movie!,
                      (p0) {
                        // Check if the movie is in the watchlist
                        final isInWatchlist =
                            provider.isMovieInWatchlist(movie!);

                        if (isInWatchlist) {
                          // Remove the movie from the watchlist
                          provider.removeFromWatchlist(movie!);
                        } else {
                          // Add the movie to the watchlist
                          provider.addToWatchlist(movie!);
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
                      Container(
                        constraints: BoxConstraints(maxWidth: 120),
                        child: Container(
                          constraints: BoxConstraints(maxWidth: 110),
                          child: Text(
                            movie?.title ?? "",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        movie?.release_date ?? "",
                        style: GoogleFonts.poppins(
                            fontSize: 10.sp, color: Colors.white),
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
                        movie!.vote_average.toString().substring(0, 3) ?? "",
                        style: TextStyle(fontSize: 18.sp, color: Colors.white),
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
      ),
    );
  }
}

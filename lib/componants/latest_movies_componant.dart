import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/componants/bookMark_componant.dart';
import 'package:movies_app/network/remote/api_constance.dart';
import 'package:provider/provider.dart';
import '../Veiw_movie_ditails_screen.dart';
import '../models/movie_response.dart';
import '../provider/my-provider.dart';

class LatestMovies extends StatelessWidget {
  MovieDitails? Movies;

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
        elevation: 8,
        child: Container(
          // height: 170,
          width: 110.w,
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
                      child: CachedNetworkImage(
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(
                          child: CircularProgressIndicator(
                            value: progress.progress,
                          ),
                        ),
                        imageUrl:
                            '${ApiConstance.base_image}${Movies!.poster_path ?? ""}',
                        fit: BoxFit.cover,
                        width: 110.w,
                        height: 140.h,
                        // placeholder: (context, url) =>
                        // const CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Image.network(
                          'https://moviereelist.com/wp-content/uploads/2019/07/poster-placeholder.jpg',
                          fit: BoxFit.cover,
                        ),
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
                      size: 19.sp,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(Movies!.vote_average.toString() ?? ""),
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
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: 14.sp),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          Movies!.release_date ?? "",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 11.sp, color: Color(0xFFB5B4B4)),
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
    );
  }
}

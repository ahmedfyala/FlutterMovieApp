import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/componants/new_release_componant.dart';
import 'package:movies_app/network/remote/api_constance.dart';
import 'package:provider/provider.dart';
import '../Veiw_movie_ditails_screen.dart';
import '../models/movie_response.dart';
import '../provider/my-provider.dart';
import 'bookMark_componant.dart';

class NowPlayingWidget extends StatelessWidget {
  MovieDitails? Movies;

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
        height: 340.h,
        child: Stack(
          children: [
            Container(
              width: 412,
              height: 217,
              child: CachedNetworkImage(
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
                imageUrl: ApiConstance.imageUrl(Movies?.backdrop_path ?? ""),
                fit: BoxFit.fitWidth,

                // placeholder: (context, url) =>
                // const CircularProgressIndicator(),
                errorWidget: (context, url, error) => Image.network(
                  'https://moviereelist.com/wp-content/uploads/2019/07/poster-placeholder.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              child: Container(
                  height: 169.h,
                  width: 119.w,
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
                                child: NewRelease(Movies),
                              ),
                              // BookMarkWidget(
                              //   Movies!,
                              //   (p0) {
                              //     // Check if the movie is in the watchlist
                              //     final isInWatchlist =
                              //         provider.isMovieInWatchlist(Movies!);
                              //
                              //     if (isInWatchlist) {
                              //       // Remove the movie from the watchlist
                              //       provider.removeFromWatchlist(Movies!);
                              //     } else {
                              //       // Add the movie to the watchlist
                              //       provider.addToWatchlist(Movies!);
                              //     }
                              //   },
                              //   //isInWatchlist, // Pass whether it's in the watchlist
                              // ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 60,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    Movies?.title ?? "",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    child: Text(
                                      Movies?.release_date ?? "",
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

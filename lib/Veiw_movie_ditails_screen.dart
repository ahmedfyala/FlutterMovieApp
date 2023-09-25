import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/componants/bookMark_componant.dart';
import 'componants/new_release_componant.dart';
import 'componants/section_title.dart';
import 'models/movie_response.dart';
import 'network/remote/api_constance.dart';
import 'network/remote/api_manager.dart';

class VeiwMovieDitails extends StatelessWidget {
  MovieDitails movies;

  VeiwMovieDitails(
    this.movies,
  );

  Color darkGray = Color(0xFF282A28);
  Color darkGray2 = Color(0xFF121312);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGray2,
      appBar: AppBar(
        backgroundColor: darkGray,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(movies.title ?? ""),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              CachedNetworkImage(
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
                imageUrl: ApiConstance.imageUrl(movies.backdrop_path ?? ""),
                fit: BoxFit.cover,
                // placeholder: (context, url) =>
                // const CircularProgressIndicator(),
                errorWidget: (context, url, error) => Image.network(
                  'https://rigginspainting.com/wp-content/uploads/2015/08/video-player-placeholder-very-large.png',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 11,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      movies.title ?? "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ),
              SizedBox(
                height: 11,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      movies.release_date ?? "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    )),
              ),
              SizedBox(
                height: 22,
              ),
              Container(
                width: 373,
                height: 208,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Stack(
                        children: [
                          Container(
                            height: 199,
                            width: 129,
                            child: CachedNetworkImage(
                              progressIndicatorBuilder:
                                  (context, url, progress) => Center(
                                child: CircularProgressIndicator(
                                  value: progress.progress,
                                ),
                              ),
                              imageUrl: ApiConstance.imageUrl(
                                  movies.poster_path ?? ""),
                              fit: BoxFit.fill,
                              width: 110,
                              height: 160,
                              // placeholder: (context, url) =>
                              // const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Image.network(
                                'https://th.bing.com/th/id/OIP.YYgJscCJOLEEKRvDIslsOgAAAA?pid=ImgDet&rs=1',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          BookMarkWidget(movies, (p0) {}),
                        ],
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.topLeft,
                    //
                    //   child: RichText(
                    //     overflow: TextOverflow.ellipsis,
                    //     maxLines: 8,
                    //     text: TextSpan(
                    //       style: TextStyle(color: Colors.white),
                    //       children: <TextSpan>[
                    //         TextSpan(
                    //           text: (movies!.overview ?? ""),
                    //         ),
                    //       ],
                    //     ),
                    // ),),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              movies.overview ?? "",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),
                            SizedBox(height: 8),
                            Align(
                                alignment: Alignment.bottomLeft,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      movies.vote_average
                                              .toString()
                                              .substring(0, 3) ??
                                          "",
                                      style: GoogleFonts.poppins(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SectionTitle('Recommendation'),
              Container(
                color: darkGray,
                height: 170.0,
                child: FutureBuilder(
                  future: ApiManager.getSimilarMovies(movies.id),
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
            ],
          ),
        ),
      ),
    );
  }
}

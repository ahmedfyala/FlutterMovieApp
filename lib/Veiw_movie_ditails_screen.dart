import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/componants/bookMark_componant.dart';
import 'models/SearchResponse.dart';
import 'models/movie_model.dart';
import 'network/remote/api_constance.dart';

class VeiwMovieDitails extends StatelessWidget {
  SearchResponse movies;

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
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Image.network(ApiConstance.imageUrl(movies.backdrop_path ?? "")),
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
                          child: Image.network(
                              ApiConstance.imageUrl(movies.poster_path ?? "")),
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
                                    movies.vote_count.toString() ?? "",
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
          ],
        ),
      ),
    );
  }
}

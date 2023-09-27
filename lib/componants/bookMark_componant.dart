import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../models/movie_response.dart';
import '../provider/my-provider.dart';

class BookMarkWidget extends StatefulWidget {
  final MovieDitails movie;

  BookMarkWidget(this.movie, this.onBookmarkClicked);

  final Function(bool) onBookmarkClicked;

  @override
  State<BookMarkWidget> createState() => _BookMarkWidgetState();
}

class _BookMarkWidgetState extends State<BookMarkWidget> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProviderApp>(context);
    bool isClicked = provider.isMovieInWatchlist(widget.movie);
    return InkWell(
      onTap: () {
        setState(() {
          if (isClicked) {
            provider.removeFromWatchlist(widget.movie);
          } else {
            provider.addToWatchlist(widget.movie);
          }
        });
      },
      child: isClicked
          ? Container(
              height: 40.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.bookmark,
                    size: 40.sp,
                    color: Colors.yellow,
                  ),
                  Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          : Container(
        height: 30.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.bookmark,
                    size: 40,
                    color: Color(0xFF514F4F),
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
    );
  }
}

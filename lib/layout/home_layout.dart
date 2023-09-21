import 'package:flutter/material.dart';

import '../browse_screen.dart';
import '../home_screen.dart';
import '../models/series.dart';
import '../search_screen.dart';
import '../wiatchlist_screen.dart';

class HomeLayout extends StatefulWidget {
  HomeLayout({super.key});

  static const String routeName = 'Home';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;
  Series? series;

  List<Widget> screenWidgets = [
    HomeScreen(),
    SearchScreen(),
    BrowseScreen(),
    WatchlistScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/Home.png'),
              ),
              label: 'HOME'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/Group 29.png'),
              ),
              label: 'SEARCH'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/Icon material-movie.png'),
              ),
              label: 'BROWSE'),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/Icon ionic-md-bookmarks.png'),
              ),
              label: 'WATCHLIST'),
        ],
      ),
      body: screenWidgets[selectedIndex],
    );
  }
}

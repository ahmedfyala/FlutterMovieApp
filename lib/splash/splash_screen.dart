import 'dart:async';
import 'package:flutter/material.dart';
import '../core/style/my_theme.dart';
import '../layout/home_layout.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  static const String routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(HomeLayout.routeName);
    });
    return Container(
      color: MyThemeData.Black,
      child: Stack(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/movies.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

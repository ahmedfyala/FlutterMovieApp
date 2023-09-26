import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:movies_app/provider/my-provider.dart';
import 'package:movies_app/splash/splash_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'browse_screen.dart';
import 'core/style/my_theme.dart';
import 'layout/home_layout.dart';
import 'models/movie_response.dart';

// Box? mybox;
//
// Future<Box> movieDitails(String boxname) async {
//   if (!Hive.isBoxOpen(boxname)) {
//     Hive.init((await getApplicationDocumentsDirectory()).path);
//   }
//   return await Hive.openBox(boxname);
//}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<MovieDitails>('movie_box');
  Hive.registerAdapter(MovieDitailsAdapter());
  // movieDitails('boxname');
  runApp(ChangeNotifierProvider(
      create: (context) {
        return MyProviderApp();
      },
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          initialRoute: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName: (context) => SplashScreen(),
            HomeLayout.routeName: (context) => HomeLayout(),
            BrowseScreen.routeName: (context) => BrowseScreen(),
          },
          debugShowCheckedModeBanner: false,
          theme: MyThemeData.lightTheme,
          darkTheme: MyThemeData.darkTheme,
          themeMode: ThemeMode.system,
        );
      },
    );
  }
}

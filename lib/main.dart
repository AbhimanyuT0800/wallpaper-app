import 'package:flutter/material.dart';
import 'package:wallpaper_app/view/pages/home_page.dart';
import 'package:wallpaper_app/view/pages/on_boarding_page.dart';
import 'package:wallpaper_app/view/pages/wallpaper_details_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // set font family default through out the app
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      routes: {
        OnBoardingPage.routerPath: (context) => const OnBoardingPage(),
        HomePage.routerPath: (context) => const HomePage(),
        WallpaperDetailsPage.routerPath: (context) =>
            const WallpaperDetailsPage()
      },
      initialRoute: OnBoardingPage.routerPath,
    );
  }
}

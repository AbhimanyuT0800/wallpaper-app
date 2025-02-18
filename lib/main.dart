import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallpaper_app/core/theme/colors/color_pallets.dart';
import 'package:wallpaper_app/model/wallpaper_model/wallpaper_model.dart';
import 'package:wallpaper_app/view/pages/home_page.dart';
import 'package:wallpaper_app/view/pages/on_boarding_page.dart';
import 'package:wallpaper_app/view/pages/wallpaper_details_page.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  ///scaffoldmessenger key for pass context
  static final scaffoldMessngerKey = GlobalKey<ScaffoldMessengerState>();
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      scaffoldMessengerKey: scaffoldMessngerKey,

      /// set font family default through out the app
      /// set scaffold background
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: ColorPallets.bgColor,
        appBarTheme: const AppBarTheme(backgroundColor: ColorPallets.bgColor),
      ),
      routes: {
        OnBoardingPage.routerPath: (context) => const OnBoardingPage(),
        HomePage.routerPath: (context) => HomePage(),
      },
      onGenerateRoute: (settings) {
        /// pass argument to the wallpaper details page
        if (settings.name == WallpaperDetailsPage.routerPath) {
          final args = settings.arguments as Photo;

          return MaterialPageRoute(
            builder: (context) {
              return WallpaperDetailsPage(
                photo: args,
              );
            },
          );
        }

        return null;
      },
      initialRoute: OnBoardingPage.routerPath,
    );
  }
}

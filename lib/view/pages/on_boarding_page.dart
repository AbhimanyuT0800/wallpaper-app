import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/constants/app_strings.dart';
import 'package:wallpaper_app/core/constants/app_urls.dart';
import 'package:wallpaper_app/core/theme/colors/color_pallets.dart';
import 'package:wallpaper_app/core/utils/dynamic_sizes.dart';
import 'package:wallpaper_app/services/fetch_wallpapers_service.dart';
import 'package:wallpaper_app/view/pages/home_page.dart';

class OnBoardingPage extends StatelessWidget {
  // router path for navigation
  static const routerPath = '/';
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    ///onboarding page
    ///with background of an asset image
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppUrls.imgBg), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth(16),
              vertical: context.screenWidth(24)),
          child: Column(
            children: [
              const Spacer(),
              const Text(
                AppStrings.txtTitle,
                style:
                    TextStyle(color: ColorPallets.primaryColor, fontSize: 24),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: context.screenHeight(70),
                child: ElevatedButton(
                  onPressed: () async {
                    await FetchWallpapersService().getWallpapers();

                    ///Navigate to home page
                    ///initalise fetching data from api
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomePage.routerPath,
                      (route) => true,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPallets.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: const Text(
                    AppStrings.txtStart,
                    style: TextStyle(
                        color: ColorPallets.grey700,
                        fontSize: 22,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

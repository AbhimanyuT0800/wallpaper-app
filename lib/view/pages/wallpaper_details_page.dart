import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallpaper_app/controller/set_wallpaper_controller/set_wallpaper_provider.dart';
import 'package:wallpaper_app/core/constants/app_strings.dart';
import 'package:wallpaper_app/core/theme/colors/color_pallets.dart';
import 'package:wallpaper_app/core/utils/dynamic_sizes.dart';
import 'package:wallpaper_app/model/wallpaper_model/wallpaper_model.dart';
import 'package:wallpaper_handler/wallpaper_handler.dart';

class WallpaperDetailsPage extends ConsumerWidget {
  // router path for navigation
  static const routerPath = '/WallpaperDetailsPage';
  const WallpaperDetailsPage({super.key, required this.photo});
  final Photo photo;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: ColorPallets.grey700),
          onPressed: () {
            ///back button for navigate to home screen
            Navigator.pop(context);
          },
        ),
        actions: [
          ///Choose where should the wallpaper set
          PopupMenuButton<String>(
            icon: const Row(
              children: [
                Text(
                  AppStrings.txtSet,
                  style: TextStyle(color: ColorPallets.grey700, fontSize: 16),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 24,
                )
              ],
            ),
            onSelected: (value) {
              if (value == AppStrings.txtHomeScreen) {
                // Set current image home screen wallpaper
                ref.watch(setWallpaperProvider(
                    location: WallpaperLocation.homeScreen,
                    url: photo.src.original));
              } else if (value == AppStrings.txtLockScreen) {
                // Set current image lock screen wallpaper
                ref.watch(setWallpaperProvider(
                    location: WallpaperLocation.lockScreen,
                    url: photo.src.original));
              } else if (value == AppStrings.txtBothScreen) {
                // Set current image both home screen and lock screen wallpaper
                ref.watch(setWallpaperProvider(
                    location: WallpaperLocation.bothScreens,
                    url: photo.src.original));
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: AppStrings.txtHomeScreen,
                  child: Text(AppStrings.txtHomeScreen),
                ),
                const PopupMenuItem(
                  value: AppStrings.txtLockScreen,
                  child: Text(AppStrings.txtLockScreen),
                ),
                const PopupMenuItem(
                    value: AppStrings.txtBothScreen,
                    child: Text(AppStrings.txtBothScreen))
              ];
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              photo.src.original,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: context.screenWidth(15)),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  color: ColorPallets.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Text(
                  photo.photographer,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: ColorPallets.grey700,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

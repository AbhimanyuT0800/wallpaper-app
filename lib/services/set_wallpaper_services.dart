import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wallpaper_app/main.dart';
import 'package:wallpaper_handler/wallpaper_handler.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

///set wallpaper for the user
///[location] get from the user where should br the wallpaper set
///home screen or lock screen
class SetWallpaperServices {
  Future<void> call(
      {required WallpaperLocation location, required String url}) async {
    try {
      File file = await DefaultCacheManager().getSingleFile(url);
      bool result = await WallpaperHandler.instance
          .setWallpaperFromFile(file.path, location);
      // show a snakbar after setting the wallpapet
      if (result) {
        MainApp.scaffoldMessngerKey.currentState!.showSnackBar(
            const SnackBar(content: Text('Wallpaper successfully set....')));
      }
    } catch (e) {
      //show a snakbar with error message for the user
      MainApp.scaffoldMessngerKey.currentState!
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}

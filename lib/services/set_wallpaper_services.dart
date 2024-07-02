import 'dart:developer';
import 'dart:io';

import 'package:wallpaper_app/core/utils/snakbar.dart';
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
      log(result.toString());
      // show a snakbar after setting the wallpapet
      if (result) {
        SnackbarUtils.showSnakBar('Wallpaper successfully set....');
      }
    } catch (e) {
      log(e.toString());
      //show a snakbar with error message for the user
      SnackbarUtils.showSnakBar(e.toString());
    }
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_app/core/exception/base_exception.dart';
import 'package:wallpaper_app/core/utils/snakbar.dart';
import 'package:wallpaper_app/model/wallpaper_model/wallpaper_model.dart';
import 'package:wallpaper_app/services/fetch_wallpapers_service.dart';

part 'fetch_wallpapers_provider.g.dart';

///fetch images from api
///add more images when function call
///state as List [photo]

@riverpod
class FetchWallpapers extends _$FetchWallpapers {
  @override
  List<Photo> build() {
    return [];
  }

  Future<void> addMorePhotos(int limit) async {
    try {
      /// list of photos added to the current state
      state = [
        ...state,
        ...(await FetchWallpapersService().getWallpapers(limit: limit)).photos
      ];
    } on BaseException catch (e) {
      ///when error catch snak barshown also error pass to the ui
      SnackbarUtils.showSnakBar(e.message);
      throw e.message;
    }
  }
}

///Limit for fetching data from api
///
final limitOfWallpaperProvider = StateProvider<int>(
  (ref) => 1,
);

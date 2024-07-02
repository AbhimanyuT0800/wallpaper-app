import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_app/core/exception/base_exception.dart';
import 'package:wallpaper_app/core/utils/snakbar.dart';
import 'package:wallpaper_app/model/wallpaper_model/wallpaper_model.dart';
import 'package:wallpaper_app/services/fetch_wallpapers_service.dart';

part 'fetch_wallpapers_provider.g.dart';

///fetch images from api
///return as [wallpaperModel]
@riverpod
Future<WallpaperModel> fetchWallpapers(FetchWallpapersRef ref) async {
  try {
    return await FetchWallpapersService().getWallpapers();
  } on BaseException catch (e) {
    ///when error catch snak barshown also error pass to the ui
    SnackbarUtils.showSnakBar(e.message);
    throw e.message;
  }
}

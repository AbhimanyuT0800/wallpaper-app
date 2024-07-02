import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_app/services/set_wallpaper_services.dart';
import 'package:wallpaper_handler/wallpaper_handler.dart';

part 'set_wallpaper_provider.g.dart';

///provider for set wallpaper user choose
///pass [location] for where should the wallpaper set
///pass [url] of the image
///
@riverpod
Future<void> setWallpaper(SetWallpaperRef ref,
    {required WallpaperLocation location, required String url}) async {
  return await SetWallpaperServices()(location: location, url: url);
}

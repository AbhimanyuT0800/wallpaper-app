import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wallpaper_app/model/wallpaper_model/wallpaper_model.dart';
import 'package:wallpaper_app/services/fetch_wallpapers_service.dart';

part 'fetch_wallpapers_provider.g.dart';

@riverpod
Future<WallpaperModel> fetchWallpapers(FetchWallpapersRef ref) async {
  return await FetchWallpapersService().getWallpapers();
}

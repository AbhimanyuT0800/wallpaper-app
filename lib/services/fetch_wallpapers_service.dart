import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:wallpaper_app/core/constants/app_urls.dart';
import 'package:wallpaper_app/model/wallpaper_model/wallpaper_model.dart';

class FetchWallpapersService {
  final Dio _dio = Dio();
  getWallpapers() async {
    try {
      _dio.options.headers["Authorization"] =
          'YG1WiehExJrl1xUnY7tWQs8GqmnZkMIZnjkaW9pRFwQE2wD2oiTym3NL';
      Response response = await _dio.get(AppUrls.apiBaseUrl,
          queryParameters: {'page': 1, 'per_page': 10});
      if (response.statusCode == 200) {
        final data = WallpaperModel.fromJson(response.data);
        log(data.photos[0].photographerUrl);
      } else {
        log(response.statusCode.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

import 'package:dio/dio.dart';
import 'package:wallpaper_app/core/constants/app_urls.dart';
import 'package:wallpaper_app/core/exception/base_exception.dart';
import 'package:wallpaper_app/model/wallpaper_model/wallpaper_model.dart';

///service for fetching wallpaper
class FetchWallpapersService {
  final Dio _dio = Dio();

  ///methos for fetching data
  ///and return as [walllpaperModel]
  /// pass [limit] for page limt
  Future<WallpaperModel> getWallpapers({required int limit}) async {
    try {
      _dio.options.headers["Authorization"] = AppUrls.apiKey;
      Response response = await _dio.get(AppUrls.apiBaseUrl,
          queryParameters: {'page': limit, 'per_page': 10});
      // response is success return wallpapermodel
      if (response.statusCode == 200) {
        return WallpaperModel.fromJson(response.data);
      } else {
        // any error shows throw base exception
        throw BaseException(
            message:
                'Somthing Went wrong... statusCode : ${response.statusCode}');
      }
    } catch (e) {
      throw BaseException(message: 'Somthing Went wrong..... !${e.toString()}');
    }
  }
}

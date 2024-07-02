import 'package:dio/dio.dart';
import 'package:wallpaper_app/core/constants/app_urls.dart';
import 'package:wallpaper_app/core/exception/base_exception.dart';
import 'package:wallpaper_app/model/wallpaper_model/wallpaper_model.dart';

class FetchWallpapersService {
  final Dio _dio = Dio();
  Future<WallpaperModel> getWallpapers() async {
    try {
      _dio.options.headers["Authorization"] =
          'YG1WiehExJrl1xUnY7tWQs8GqmnZkMIZnjkaW9pRFwQE2wD2oiTym3NL';
      Response response = await _dio
          .get(AppUrls.apiBaseUrl, queryParameters: {'page': 1, 'per_page': 5});
      if (response.statusCode == 200) {
        return WallpaperModel.fromJson(response.data);
      } else {
        throw BaseException(
            message:
                'Somthing Went wrong... statusCode : ${response.statusCode}');
      }
    } catch (e) {
      throw BaseException(message: 'Somthing Went wrong..... !${e.toString()}');
    }
  }
}

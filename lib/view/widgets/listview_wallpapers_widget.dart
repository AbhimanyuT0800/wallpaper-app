import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/utils/dynamic_sizes.dart';
import 'package:wallpaper_app/model/wallpaper_model/wallpaper_model.dart';
import 'package:wallpaper_app/view/pages/wallpaper_details_page.dart';

class ListViewWallpapersWidget extends StatelessWidget {
  const ListViewWallpapersWidget({
    super.key,
    required this.photos,
    required this.controller,
  });
  final ScrollController controller;
  final List<Photo> photos;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        controller: controller,
        itemBuilder: (context, index) {
          return index != photos.length
              ? InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, WallpaperDetailsPage.routerPath,
                        arguments: photos[index]);
                  },
                  child: Container(
                    width: double.infinity,
                    height: context.screenHeight(200),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(context.screenHeight(20)),
                      image: DecorationImage(
                          image: NetworkImage(photos[index].src.original),
                          fit: BoxFit.cover),
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator());
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: photos.length + 1);
  }
}

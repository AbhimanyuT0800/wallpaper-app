import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/utils/dynamic_sizes.dart';
import 'package:wallpaper_app/model/wallpaper_model/wallpaper_model.dart';
import 'package:wallpaper_app/view/pages/wallpaper_details_page.dart';

class GridviewWallpapersWidget extends StatelessWidget {
  const GridviewWallpapersWidget(
      {super.key, required this.photos, required this.controller});
  final List<Photo> photos;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: context.screenHeight(20),
          mainAxisSpacing: context.screenHeight(20)),
      itemCount: photos.length + 1,
      itemBuilder: (context, index) {
        return index != photos.length
            ? InkWell(
                onTap: () {
                  ///navigate to details page
                  ///pass photos as argument
                  Navigator.pushNamed(context, WallpaperDetailsPage.routerPath,
                      arguments: photos[index]);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(context.screenHeight(20)),
                    image: DecorationImage(
                        image: NetworkImage(photos[index].src.original),
                        fit: BoxFit.cover),
                  ),
                ),
              )

            /// when reached the bottom of the list shows a circularProgerss indicator
            /// for delay when new data reach the list
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}

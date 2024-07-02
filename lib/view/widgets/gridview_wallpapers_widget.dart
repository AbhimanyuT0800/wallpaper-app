import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/utils/dynamic_sizes.dart';
import 'package:wallpaper_app/model/wallpaper_model/wallpaper_model.dart';
import 'package:wallpaper_app/view/pages/wallpaper_details_page.dart';

class GridviewWallpapersWidget extends StatelessWidget {
  const GridviewWallpapersWidget({super.key, required this.data});
  final WallpaperModel data;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: context.screenHeight(20),
          mainAxisSpacing: context.screenHeight(20)),
      itemCount: data.photos.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            ///navigate to details page
            ///pass photos as argument
            Navigator.pushNamed(context, WallpaperDetailsPage.routerPath,
                arguments: data.photos[index]);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(context.screenHeight(20)),
              image: DecorationImage(
                  image: NetworkImage(data.photos[index].src.original),
                  fit: BoxFit.cover),
            ),
          ),
        );
      },
    );
  }
}

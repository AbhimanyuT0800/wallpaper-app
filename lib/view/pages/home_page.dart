import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallpaper_app/controller/fetch_wallpapers_controller/fetch_wallpapers_provider.dart';
import 'package:wallpaper_app/core/constants/app_strings.dart';
import 'package:wallpaper_app/core/theme/colors/color_pallets.dart';
import 'package:wallpaper_app/core/utils/dynamic_sizes.dart';
import 'package:wallpaper_app/view/pages/wallpaper_details_page.dart';

class HomePage extends ConsumerWidget {
  // router path for navigation
  static const routerPath = '/HomePage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            AppStrings.txtTitle,
            style: TextStyle(color: ColorPallets.primaryColor),
          ),
        ),
        body: ref.watch(fetchWallpapersProvider).when(
              data: (data) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.screenWidth(50),
                  ),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, WallpaperDetailsPage.routerPath,
                                arguments: data.photos[index]);
                          },
                          child: Container(
                            width: double.infinity,
                            height: context.screenHeight(200),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      data.photos[index].src.original),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: data.photos.length),
                );
              },

              /// error widget
              /// when error occures [error] shows
              error: (error, stackTrace) => Center(
                child: Text(
                  error.toString(),
                  style: const TextStyle(color: Colors.amber),
                ),
              ),

              ///Loading widget
              ///simple circularProgressIndicator shows
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }
}

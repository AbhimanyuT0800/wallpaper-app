import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/theme/colors/color_pallets.dart';
import 'package:wallpaper_app/model/wallpaper_model/wallpaper_model.dart';

// class WallpaperDetailsPage extends StatelessWidget {
//   // router path for navigation
//   static const routerPath = '/WallpaperDetailsPage';
//   const WallpaperDetailsPage({super.key, required this.photo});
//   final Photo photo;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: NetworkImage(photo.src.original),
//           ),
//         ),
//       ),
//     );
//   }
// }

class WallpaperDetailsPage extends StatelessWidget {
  // router path for navigation
  static const routerPath = '/WallpaperDetailsPage';
  const WallpaperDetailsPage({super.key, required this.photo});
  final Photo photo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              photo.src.original,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: ColorPallets.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    photo.photographer,
                    style: const TextStyle(
                      color: ColorPallets.grey700,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.download,
                          color: ColorPallets.grey700,
                        ),
                        onPressed: () {
                          //TODO : Handle download action
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.favorite_border_outlined,
                          color: ColorPallets.grey700,
                        ),
                        onPressed: () {
                          //TODO :  Handle favorite action
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.wallpaper,
                          color: ColorPallets.grey700,
                        ),
                        onPressed: () {
                          //TODO :  Handle set wallpaper action
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

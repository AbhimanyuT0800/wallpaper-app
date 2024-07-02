import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wallpaper_app/controller/fetch_wallpapers_controller/fetch_wallpapers_provider.dart';
import 'package:wallpaper_app/core/constants/app_strings.dart';
import 'package:wallpaper_app/core/theme/colors/color_pallets.dart';
import 'package:wallpaper_app/core/utils/dynamic_sizes.dart';
import 'package:wallpaper_app/view/widgets/gridview_wallpapers_widget.dart';
import 'package:wallpaper_app/view/widgets/listview_wallpapers_widget.dart';

class HomePage extends HookConsumerWidget {
  // router path for navigation
  static const routerPath = '/HomePage';
  HomePage({super.key});
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// select Listview or gridview shown in the ui
    /// select by user from floating actionbutton
    /// by default listview shown
    ValueNotifier<bool> isListView = useState<bool>(true);

    final photos = ref.watch(fetchWallpapersProvider);

    useEffect(
      () {
        // checks scroll controller wether it is reaached bottom or not
        scrollController.addListener(
          () {
            if (scrollController.position.atEdge) {
              bool isTop = scrollController.position.pixels == 0;
              if (!isTop) {
                /// if it is reched bottom add one more page
                /// and add one more page to the state : list of wallpapers

                ref.watch(limitOfWallpaperProvider.notifier).state += 1;

                ref
                    .watch(fetchWallpapersProvider.notifier)
                    .addMorePhotos(ref.read(limitOfWallpaperProvider));
              }
            }
          },
        );

        return null;
      },
    );

    ///when the state of photos is empty
    ///call addMore photos metod once
    if (photos.isEmpty) {
      ref.watch(fetchWallpapersProvider.notifier).addMorePhotos(1);
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          AppStrings.txtTitle,
          style: TextStyle(color: ColorPallets.primaryColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.screenWidth(50),
        ),

        ///Chose how home screen should shows
        child: isListView.value
            ? ListViewWallpapersWidget(
                photos: photos,
                controller: scrollController,
              )
            : GridviewWallpapersWidget(
                photos: photos,
                controller: scrollController,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// toggle the value of isListView
          isListView.value = !isListView.value;
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

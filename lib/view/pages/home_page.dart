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
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// select Listview or gridview shown in the ui
    /// select by user from floating actionbutton
    /// by default listview shown
    ValueNotifier<bool> isListView = useState<bool>(true);

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

                ///Chose how home screen should shows
                child: isListView.value
                    ? ListViewWallpapersWidget(data: data)
                    : GridviewWallpapersWidget(data: data),
              );
            },

            /// error widget
            /// when error occures [error] shows as a text
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),

            ///Loading widget
            ///simple circularProgressIndicator shows
            loading: () => const Center(
              child: CircularProgressIndicator(),
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

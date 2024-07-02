import 'package:flutter/material.dart';
import 'package:wallpaper_app/main.dart';

class SnackbarUtils {
  /// Show a message as a snackbar
  /// [message] Is the message to be shown to the user
  static void showError(String message) {
    MainApp.scaffoldMessngerKey.currentState!
        .showSnackBar(SnackBar(content: Text(message)));
  }
}

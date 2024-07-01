import 'package:flutter/material.dart';

///responsive sizes
///width and height according to screen,
///with 460:1004 ratio
extension DynamicSizes on BuildContext {
  double screenWidth(double w) {
    return MediaQuery.sizeOf(this).width * (w / 460);
  }

  double screenHeight(double h) {
    return MediaQuery.sizeOf(this).height * (h / 1004);
  }
}

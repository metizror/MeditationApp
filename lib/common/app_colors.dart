import 'package:flutter/material.dart';


class AppColors {
  static final Color white_color = HexColor("#FFFFFF");
  static final Color purple_color = HexColor("#6C4AFF");
  static final Color green_color = HexColor("#1AC742");
  static final Color red_color = HexColor("#F84444");
  static final Color orange_color = HexColor("#FFB238");
  static final Color blue_color = HexColor("#4A80F0");
  static final Color grey_bg = HexColor("#F4F5F6");
  static final Color pink = HexColor("#FB9B9C");

}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

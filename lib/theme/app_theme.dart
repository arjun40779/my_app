import 'package:flutter/material.dart';

import '../utils/size_config.dart';

@immutable
class AppColors {
  static const primary = Color.fromRGBO(21, 22, 36, 1);
  static const primaryLight = Color.fromRGBO(65, 67, 88, 1);
  static const grey = Color.fromRGBO(192, 192, 206, 1);
  static const backgroungColor = Color.fromRGBO(245, 238, 230, 1);
  static const greyDark = Color.fromRGBO(81, 81, 91, 1);
  static const secondary = Color.fromRGBO(255, 214, 0, 1);
  static const secondaryLight = Color.fromRGBO(241, 228, 162, 1);
  static const green = Color.fromARGB(255, 72, 149, 74);
  static const blue = Color.fromARGB(255, 0, 63, 163);
  static const transparent = Colors.transparent;
  static const red = Colors.red;
}

class AppTextStyle {
  static TextStyle heading({
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    Color? color,
    TextDecoration? decoration,
    double? height,
  }) {
    final defaultFontSize = SizeConfig.textMultiplier * 4.3;
    const defaultFontWeight = FontWeight.w600;
    const defaultLetterSpacing = 0.0;
    const defaultFontColor = AppColors.primary;
    const defaultFontHeight = 1.2;

    return TextStyle(
      fontSize: fontSize ?? defaultFontSize,
      fontWeight: fontWeight ?? defaultFontWeight,
      letterSpacing: letterSpacing ?? defaultLetterSpacing,
      color: color ?? defaultFontColor,
      height: height ?? defaultFontHeight,
    );
  }

  static TextStyle subHeading({
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    Color? color,
    TextDecoration? decoration,
    double? height,
  }) {
    final defaultFontSize = SizeConfig.textMultiplier * 3.8;
    const defaultFontWeight = FontWeight.normal;
    const defaultLetterSpacing = 0.0;
    const defaultFontColor = AppColors.primaryLight;
    const defaultFontHeight = 1.2;

    return TextStyle(
      fontSize: fontSize ?? defaultFontSize,
      fontWeight: fontWeight ?? defaultFontWeight,
      letterSpacing: letterSpacing ?? defaultLetterSpacing,
      color: color ?? defaultFontColor,
      height: height ?? defaultFontHeight,
    );
  }

  static TextStyle normal({
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    Color? color,
    TextDecoration? decoration,
    double? height,
  }) {
    final defaultFontSize = SizeConfig.textMultiplier * 3;
    const defaultFontWeight = FontWeight.normal;
    const defaultLetterSpacing = 0.0;
    const defaultFontColor = AppColors.primary;
    const defaultFontHeight = 1.0;

    return TextStyle(
      fontSize: fontSize ?? defaultFontSize,
      fontWeight: fontWeight ?? defaultFontWeight,
      letterSpacing: letterSpacing ?? defaultLetterSpacing,
      color: color ?? defaultFontColor,
      height: height ?? defaultFontHeight,
    );
  }
}

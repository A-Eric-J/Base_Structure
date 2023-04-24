import 'package:base_structure_project/const_values/assets.dart';
import 'package:flutter/material.dart';

/// We use Roboto font in this app and here is different styles of this font
/// but you can use your font instead

TextStyle robotoNormalStyle(double size, Color color) {
  return TextStyle(
    fontSize: size,
    fontWeight: FontWeight.normal,
    fontFamily: Assets.robotoRegular,
    color: color,
  );
}

TextStyle robotoUnderLineStyle(double size, Color color) {
  return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.normal,
      fontFamily: Assets.robotoRegular,
      color: color,
      decoration: TextDecoration.underline,
      decorationColor: color,
      decorationThickness: 0.4,
      decorationStyle: TextDecorationStyle.solid);
}

TextStyle robotoBoldStyle(double size, Color color, FontWeight fontWeight) {
  return TextStyle(
    fontSize: size,
    fontWeight: fontWeight,
    fontFamily: Assets.robotoRegular,
    color: color,
  );
}

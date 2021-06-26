
import 'package:flutter/material.dart';

class CustomColors{
  static String colorPrimary = _getColorFromHex('#336e9b');
  static String colorSecondary = _getColorFromHex('#3676a7');
  static String loginButtonColor = _getColorFromHex('#041167');

  // static const kPrimaryColor = Color(0xFFEB5C20);
  // static const kAccentColor = Color(0xFFEB5C20);
  static const kButtonColor = Color(0xFFEB5C20);
  static const kPanelBack = Color(0xFFEC5A1E);
  static const kSecondaryButtonColor = Color(0xFFEB5C20);
  static const kPrimaryTextColor = Color(0xFF575759);
  static const kBoxBorderColor = Color(0xFFC4C4C4);
  static const kBoxBackgroundColor = Color(0xFFD0D0D0);
  static const app_red  = Color(0xFF9F0505);
  static const app_light_red  = Color(0xFFDC0E0E);
  static const app_green  = Color(0xFF059F1A);
  static const app_grey  = Color(0xFF7E7E7E);
  static const app_moderate_green  = Color(0xFF008E8A);
  static const app_deep_blue  = Color(0xFF05059f);
  static const app_pink  = Color(0xFF9F0576);
  static const app_light_pink  = Color(0xFFBC0BAB);
  static const app_light_green  = Color(0xFF9F9F05);
  static const app_dark_green  = Color(0xFF67640C);

  static const iconColor = Colors.black45;
  static const statusBar = Colors.grey;
  static String _getColorFromHex(String color){
    return color.replaceAll("#", "0xff");
  }
}

import 'package:flutter/material.dart';

class CustomColors{
  static String colorPrimary = _getColorFromHex('#336e9b');
  static String colorSecondary = _getColorFromHex('#3676a7');
  static String loginButtonColor = _getColorFromHex('#041167');

  static const kPrimaryColor = Color(0xFFEB5C20);
  static const kAccentColor = Color(0xFFEB5C20);
  static const kButtonColor = Color(0xFFEB5C20);
  static const kSecondaryButtonColor = Color(0xFFEB5C20);
  static const kPrimaryTextColor = Color(0xFF575759);
  static const kBoxBorderColor = Color(0xFFC4C4C4);
  static const kBoxBackgroundColor = Color(0xFFD0D0D0);

  static const iconColor = Colors.black45;
  static const statusBar = Colors.grey;
  static String _getColorFromHex(String color){
    return color.replaceAll("#", "0xff");
  }
}
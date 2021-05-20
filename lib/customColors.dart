
import 'package:flutter/material.dart';

class CustomColors{
  static String colorPrimary = _getColorFromHex('#336e9b');
  static String colorSecondary = _getColorFromHex('#3676a7');
  static String loginButtonColor = _getColorFromHex('#041167');
  static const statusBar = Colors.grey;
  static String _getColorFromHex(String color){
    return color.replaceAll("#", "0xff");
  }
}
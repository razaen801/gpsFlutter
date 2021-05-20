
import 'package:flutter/material.dart';
import 'package:my_gps_app/customColors.dart';

class Constant{
  static final String appName="EZ2Track";

  static final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      onPrimary: Color(int.parse(CustomColors.loginButtonColor)),
      primary: Color(int.parse(CustomColors.loginButtonColor)),
      onSurface: Color(int.parse(CustomColors.loginButtonColor)),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      )
  );
}
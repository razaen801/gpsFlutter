
import 'package:flutter/material.dart';
import 'package:my_gps_app/customColors.dart';

class Constant{
  static final String appName="EZ2Track";

  static final double appBarSize = 40.0;
  static final String baseUrl = "http://202.51.74.204/";



  static final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      // onPrimary: CustomColors.kButtonColor,
      // primary: CustomColors.kButtonColor,
      // onSurface: CustomColors.kButtonColor,
    primary: CustomColors.kButtonColor,
      textStyle: TextStyle(color: CustomColors.kButtonColor),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      )
  );

  static BoxDecoration getDialogContainerStyle(double cornerWidth){
    return BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(cornerWidth)),
        boxShadow: [
          BoxShadow(
              color:  Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              offset: Offset(0,2)
          )
        ]
    );
  }

  static final BoxDecoration dialogContainerStyle = BoxDecoration(
      shape: BoxShape.rectangle,
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(3)),
      boxShadow: [
        BoxShadow(
            color:  Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            offset: Offset(0,2)
        )
      ]
  );

  static final BoxDecoration buttonDecoration= BoxDecoration(
    shape:BoxShape.rectangle,
    borderRadius: BorderRadius.all(Radius.circular(15)),
    color: CustomColors.kButtonColor,
  );

}
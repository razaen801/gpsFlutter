
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:my_gps_app/customColors.dart';
import 'package:my_gps_app/utility/shared_preferences_helper.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

void showMessage(String title,String message,BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          actions: [
            FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("Ok"))
          ],
          content: Text(
              message),
        );
      });
}

Future<LocationData> getLocation() async{
  Location location = new Location();
  return location.getLocation();
}



Future<bool> checkLocationPermission(BuildContext context,bool enableBackgroundMode) async{
  String msg = "";
  Location location = new Location();
  bool hasPermission = false;
  bool _serviceEnabled = await location.serviceEnabled();
  if(_serviceEnabled){
    hasPermission = true;
  }
  else{
    hasPermission = false;
    _serviceEnabled = await location.requestService();
    if(!_serviceEnabled){
      hasPermission = false;
      showMessage("Warning Message", "Please enable location service first", context);
      return false;
    }
    else
    {
      hasPermission = true;
    }
  }

  PermissionStatus _permissionGranted;
  // LocationData _locationData;
  _permissionGranted = await location.hasPermission();
  if(_permissionGranted== PermissionStatus.denied){
    _permissionGranted = await location.requestPermission();
    if(_permissionGranted==PermissionStatus.granted){
      // _locationData = await location.getLocation();
      location.enableBackgroundMode(enable: enableBackgroundMode);
      hasPermission = true;
      return true;
    }
    else if (_permissionGranted!=PermissionStatus.granted){
      showMessage("Info","Location is required. Please grant location permission",context);
      hasPermission = false;
    }
  }
  else  if(_permissionGranted==PermissionStatus.granted){
    // _locationData = await location.getLocation();
    location.enableBackgroundMode(enable: enableBackgroundMode);
    hasPermission = true;
  }

  return hasPermission;
}


class Constant{
  static final String appName="EZ2Track";

  static final double appBarSize = 40.0;
  static final String baseUrl = "http://202.51.74.204/";

  static showToastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: CustomColors.KSecondaryColor,
        textColor: CustomColors.kButtonColor,
        fontSize: 15.0
    );

  }


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
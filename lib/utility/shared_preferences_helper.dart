
import 'package:my_gps_app/iDash/panel_gps.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RaSharedPreferenceConfig{
  static String ACCESS_TOKEN = "shared_preferences_token";
  static String searchingForGPS = "SEARCHING_FOR_GPS";
  static String selectedDevice = "selected_device_id";
  static String selectedDeviceName = "selected_device_name";

  static setToken(token) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(ACCESS_TOKEN, token);
  }
  static getToken() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return  preferences.getString(ACCESS_TOKEN);
  }
  static Future<int> getDeviceId() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return  int.parse(preferences.getString(selectedDevice)!);
  }
  static setDeviceId(int deviceId) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(selectedDevice, deviceId.toString());
  }
  static getDeviceName() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return  preferences.getString(selectedDeviceName);
  }
  static setDeviceName(String name) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(selectedDeviceName, name);
  }



  static isSearching(bool isSearching) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(searchingForGPS, isSearching);
  }

  static Future<bool> getIsSearching() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return  preferences.getBool(searchingForGPS)??false;
  }
}
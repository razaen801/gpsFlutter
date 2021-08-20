import 'package:my_gps_app/server_handler/models/allLocations/all_location_list.dart';
import 'package:my_gps_app/server_handler/models/gpsDevice/all_gps_device.dart';
import 'package:my_gps_app/server_handler/models/submitLocationResponse/submit_location_response.dart';

abstract class NetworkDataSource{
  Future<SubmitLocationResponse> submitLocation(String token, String id, double longitude, double latitude);

  Future<AllLocationResponse> getAllDeviceLocation(String token);

  Future<AllGpsLocationResponse> getAllGpsDevice(String token);
}
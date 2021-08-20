import 'package:my_gps_app/server_handler/models/allLocations/all_location_list.dart';
import 'package:my_gps_app/server_handler/models/gpsDevice/all_gps_device.dart';
import 'package:my_gps_app/server_handler/models/submitLocationResponse/submit_location_response.dart';
import 'package:my_gps_app/server_handler/network/network_api_client.dart';
import 'package:my_gps_app/server_handler/network/network_data_source.dart';
import 'package:dio/dio.dart';
import 'package:my_gps_app/utility/shared_preferences_helper.dart';


class NetworkRepository extends NetworkDataSource{
  late Dio dio;
  late NetworkApiClient networkApiClient;

  NetworkRepository(){
    dio = Dio();
    networkApiClient = NetworkApiClient(dio);
  }

  @override
  Future<SubmitLocationResponse> submitLocation(String token,String id, double longitude, double latitude) {
    return networkApiClient.submitLocation(token,id, longitude, latitude);
  }

  @override
  Future<AllLocationResponse> getAllDeviceLocation(String token) {
    return networkApiClient.getAllLocation(token);
  }

  @override
  Future<AllGpsLocationResponse> getAllGpsDevice(String token) {
    return networkApiClient.getAllGpsDevice(token);
    // TODO: implement getAllGpsDevice
    throw UnimplementedError();
  }

}
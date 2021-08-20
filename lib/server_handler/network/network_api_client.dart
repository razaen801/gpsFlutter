
import 'package:dio/dio.dart';
import 'package:my_gps_app/server_handler/models/allLocations/all_location_list.dart';
import 'package:my_gps_app/server_handler/models/gpsDevice/all_gps_device.dart';
import 'package:my_gps_app/server_handler/models/submitLocationResponse/submit_location_response.dart';
import 'package:retrofit/http.dart';

part 'network_api_client.g.dart';

@RestApi(baseUrl: "http://202.51.74.204/")

abstract class NetworkApiClient{
  factory NetworkApiClient(Dio dio, {String baseUrl}) = _NetworkApiClient;

  @POST("api/device/location")
  Future<SubmitLocationResponse> submitLocation(@Header("Authorization") String token,@Query("deviceId") String id,@Query("lng")  double longitude, @Query("lat") double latitude);

  @GET("api/device/location")
  Future<AllLocationResponse> getAllLocation(@Header("Authorization") String token);

  @GET("api/device/list")
  Future<AllGpsLocationResponse> getAllGpsDevice(@Header("Authorization") String token);


}
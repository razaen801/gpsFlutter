
import 'package:dio/dio.dart';
import 'package:my_gps_app/server_handler/models/allLocations/all_location_list.dart';
import 'package:my_gps_app/server_handler/models/allMessages/message_response.dart';
import 'package:my_gps_app/server_handler/models/attendance/attendance_response.dart';
import 'package:my_gps_app/server_handler/models/expenses/expense_response.dart';
import 'package:my_gps_app/server_handler/models/gpsDevice/all_gps_device.dart';
import 'package:my_gps_app/server_handler/models/panic/panic_response.dart';
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

  @POST("/api/daily/attendace/fetch")
  Future<AttendanceResponse> getUserDetail(@Query("user_id") String userId);


  @GET("/api/messages/list")
  Future<MessageResponse> getAllMessages();

  @POST("api/take/attendance")
  Future<AttendanceResponse> checkInUser(@Query("user_id") String userId,
      @Query("type") String type,
      @Query("attendance") String attendance,
      @Query("checkin_location") String checkin_location,
      );

  @POST("/api/take/attendance")
  Future<AttendanceResponse> checkOutUser(@Query("user_id") String userId,
      @Query("type") String type,
      @Query("attendance") String attendance,
      @Query("checkout_location") String checkout_location,
      );

  @GET("/api/expenses/list")
  Future<ExpenseResponse> getAllExpenses();

  @POST("/api/panics/store")
  Future<PanicResponse> submitPanicForm(
      @Query("name") String name,
      @Query("email") String email,
      @Query("phone") String phone,
      @Query("location") String location,
      @Query("image") String image,
      @Query("type") String type,
      );
}
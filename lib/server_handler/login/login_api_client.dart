import 'package:my_gps_app/constants.dart';
import 'package:dio/dio.dart';
import 'package:my_gps_app/server_handler/login/login_response.dart';
import 'package:retrofit/retrofit.dart';

part 'login_api_client.g.dart';

@RestApi(baseUrl: "http://202.51.74.204/")

abstract class LoginApiClient{
  factory LoginApiClient(Dio dio, {String baseUrl})= _LoginApiClient;

  @POST("api/login")
  Future<LoginResponse> loginUser(@Query("email") String email, @Query("password") String password,@Header("Content-type") String type);

}

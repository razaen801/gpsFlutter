
import 'package:dio/dio.dart';
import 'package:my_gps_app/server_handler/login/login_api_client.dart';
import 'package:my_gps_app/server_handler/login/login_response.dart';

import 'login_data_source.dart';

class LoginRepository extends LoginDataSource{
  Dio _dio = Dio();
  late LoginApiClient loginApiClient;

  LoginRepository(){
    _dio = Dio();
   loginApiClient = LoginApiClient(_dio);
  }
  @override
  Future<LoginResponse> loginUser(String email, String password) {
    return loginApiClient.loginUser(email, password,"application/json");
    // TODO: implement loginUser
    throw UnimplementedError();
  }

}
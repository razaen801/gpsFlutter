
import 'package:my_gps_app/server_handler/login/login_response.dart';

abstract class LoginDataSource{
  Future<LoginResponse> loginUser(String email, String password);
}
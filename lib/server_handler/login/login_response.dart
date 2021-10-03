
import 'package:json_annotation/json_annotation.dart';
import 'package:my_gps_app/server_handler/login/login_user_details.dart';

part 'login_response.g.dart';

@JsonSerializable()

class LoginResponse {
  String status;
  String token;
  LoginUserDetails user;

  LoginResponse({required this.status, required this.token,required this.user});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  // {
  //   status = json['status'];
  //   token = json['token'];
  // }

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  // {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['status'] = this.status;
  //   data['token'] = this.token;
  //   return data;
  // }
}
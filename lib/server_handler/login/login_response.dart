
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()

class LoginResponse {
  String status;
  String token;

  LoginResponse({required this.status, required this.token});

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
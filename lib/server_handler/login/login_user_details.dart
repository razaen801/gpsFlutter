import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_user_details.g.dart';

LoginUserDetails loginUserDetailsFromJson(String str) => LoginUserDetails.fromJson(json.decode(str));

String loginUserDetailsToJson(LoginUserDetails data) => json.encode(data.toJson());

@JsonSerializable()
@HiveType(typeId: 1)
class LoginUserDetails {
  LoginUserDetails({
    required this.id,
    required this.name,
    required this.email,
  });
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String email;

  factory LoginUserDetails.fromJson(Map<String, dynamic> json) => LoginUserDetails(
    id: json["id"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
  };
}
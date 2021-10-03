// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginUserDetails _$LoginUserDetailsFromJson(Map<String, dynamic> json) {
  return LoginUserDetails(
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
  );
}

Map<String, dynamic> _$LoginUserDetailsToJson(LoginUserDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };

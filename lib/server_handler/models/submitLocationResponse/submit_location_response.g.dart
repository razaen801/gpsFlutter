// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitLocationResponse _$SubmitLocationResponseFromJson(
    Map<String, dynamic> json) {
  return SubmitLocationResponse(
    json['status'] as String,
    json['message'] as String,
  );
}

Map<String, dynamic> _$SubmitLocationResponseToJson(
        SubmitLocationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

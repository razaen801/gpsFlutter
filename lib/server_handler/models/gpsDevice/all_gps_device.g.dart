// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_gps_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllGpsLocationResponse _$AllGpsLocationResponseFromJson(
    Map<String, dynamic> json) {
  return AllGpsLocationResponse(
    (json['devices'] as List<dynamic>)
        .map((e) => GpsLocationDetail.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['status'] as String,
  );
}

Map<String, dynamic> _$AllGpsLocationResponseToJson(
        AllGpsLocationResponse instance) =>
    <String, dynamic>{
      'devices': instance.details,
      'status': instance.status,
    };

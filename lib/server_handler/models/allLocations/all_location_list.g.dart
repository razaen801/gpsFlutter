// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_location_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllLocationResponse _$AllLocationResponseFromJson(Map<String, dynamic> json) {
  return AllLocationResponse(
    (json['details'] as List<dynamic>)
        .map((e) => LocationDetail.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['status'] as String,
  );
}

Map<String, dynamic> _$AllLocationResponseToJson(
        AllLocationResponse instance) =>
    <String, dynamic>{
      'details': instance.details,
      'status': instance.status,
    };

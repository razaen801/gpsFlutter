// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationDetail _$LocationDetailFromJson(Map<String, dynamic> json) {
  return LocationDetail(
    json['id'] as int,
    json['name'] as String,
    json['lng'] as String,
    json['lat'] as String,
  );
}

Map<String, dynamic> _$LocationDetailToJson(LocationDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lng': instance.lng,
      'lat': instance.lat,
    };

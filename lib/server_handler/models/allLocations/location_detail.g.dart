// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationDetail _$LocationDetailFromJson(Map<String, dynamic> json) {
  return LocationDetail(
    DateTime.parse(json['created_at'] as String),
    json['id'] as int,
    json['name'] as String,
    (json['lng'] as num).toDouble(),
    (json['lat'] as num).toDouble(),
  );
}

Map<String, dynamic> _$LocationDetailToJson(LocationDetail instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'name': instance.name,
      'lng': instance.lng,
      'lat': instance.lat,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceResponse _$AttendanceResponseFromJson(Map<String, dynamic> json) {
  return AttendanceResponse(
    AttendanceDetails.fromJson(json['attendances'] as Map<String, dynamic>),
    json['result'] as String,
  );
}

Map<String, dynamic> _$AttendanceResponseToJson(AttendanceResponse instance) =>
    <String, dynamic>{
      'attendances': instance.attendances,
      'result': instance.result,
    };

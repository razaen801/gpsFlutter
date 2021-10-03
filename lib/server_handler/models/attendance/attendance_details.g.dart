// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendanceDetails _$AttendanceDetailsFromJson(Map<String, dynamic> json) {
  return AttendanceDetails(
    json['user_id'] as int?,
    json['id'] as int,
    json['attendance_id'] as int?,
    json['date'] as String,
    json['name'] as String?,
    json['email'] as String?,
    json['checkin'] as String?,
    json['checkout'] as String?,
    json['checkin_location'] as String,
    json['checkout_location'] as String,
    json['note'] as String?,
    json['updated_at'] as String,
    json['created_at'] as String,
  );
}

Map<String, dynamic> _$AttendanceDetailsToJson(AttendanceDetails instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'id': instance.id,
      'attendance_id': instance.attendance_id,
      'date': instance.date,
      'name': instance.name,
      'email': instance.email,
      'checkin': instance.checkin,
      'checkout': instance.checkout,
      'checkin_location': instance.checkin_location,
      'checkout_location': instance.checkout_location,
      'note': instance.note,
      'updated_at': instance.updated_at,
      'created_at': instance.created_at,
    };

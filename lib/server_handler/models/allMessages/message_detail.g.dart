// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageDetails _$MessageDetailsFromJson(Map<String, dynamic> json) {
  return MessageDetails(
    json['id'] as int,
    json['message'] as String,
    json['userid'] as String,
    json['parentid'] as String,
    json['date'] as String,
    json['time'] as String,
    json['file'] as String,
    json['emoji'] as String,
    json['created_at'] as String,
    json['updated_at'] as String,
  );
}

Map<String, dynamic> _$MessageDetailsToJson(MessageDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
      'userid': instance.userid,
      'parentid': instance.parentid,
      'date': instance.date,
      'time': instance.time,
      'file': instance.file,
      'emoji': instance.emoji,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };

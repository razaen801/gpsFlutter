// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) {
  return MessageResponse(
    (json['messages'] as List<dynamic>)
        .map((e) => MessageDetails.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['result'] as String,
  );
}

Map<String, dynamic> _$MessageResponseToJson(MessageResponse instance) =>
    <String, dynamic>{
      'messages': instance.messageDetails,
      'result': instance.result,
    };

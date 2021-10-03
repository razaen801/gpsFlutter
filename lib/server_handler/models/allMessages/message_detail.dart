import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'message_detail.g.dart';


@JsonSerializable()
@entity
class MessageDetails{

  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "message")
  final String message;

  @JsonKey(name: "userid")
  final String userid;

  @JsonKey(name: "parentid")
  final String parentid;

  @JsonKey(name: "date")
  final String date;

  @JsonKey(name: "time")
  final String time;

  @JsonKey(name: "file")
  final String file;

  @JsonKey(name: "emoji")
  final String emoji;

   @JsonKey(name: "created_at")
  final String created_at;

   @JsonKey(name: "updated_at")
  final String updated_at;

  MessageDetails(this.id, this.message, this.userid, this.parentid, this.date,
      this.time, this.file, this.emoji, this.created_at, this.updated_at);

  factory MessageDetails.fromJson(Map<String,dynamic> json) => _$MessageDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MessageDetailsToJson(this);




}
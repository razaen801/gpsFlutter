import 'package:json_annotation/json_annotation.dart';
import 'package:my_gps_app/server_handler/models/allMessages/message_detail.dart';

part 'message_response.g.dart';

@JsonSerializable()
class MessageResponse{
  @JsonKey(name: 'messages')
  final List<MessageDetails> messageDetails;

  @JsonKey(name: 'result')
  final String result;

  MessageResponse(this.messageDetails, this.result);

  factory MessageResponse.fromJson(Map<String,dynamic> json) => _$MessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);


}
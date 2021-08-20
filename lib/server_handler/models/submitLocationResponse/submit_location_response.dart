import 'package:json_annotation/json_annotation.dart';

part 'submit_location_response.g.dart';

@JsonSerializable()
class SubmitLocationResponse{
  
  String status;
  String message;

  SubmitLocationResponse(this.status, this.message);

  factory SubmitLocationResponse.fromJson(Map<String, dynamic> json) => _$SubmitLocationResponseFromJson(json);

  Map<String, dynamic> toJson()=> _$SubmitLocationResponseToJson(this);


}
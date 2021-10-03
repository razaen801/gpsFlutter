import 'package:json_annotation/json_annotation.dart';
import 'package:my_gps_app/server_handler/models/allLocations/location_detail.dart';
import 'package:my_gps_app/server_handler/models/attendance/attendance_details.dart';
import 'package:my_gps_app/server_handler/models/gpsDevice/gps_devices.dart';

part 'attendance_response.g.dart';

@JsonSerializable()
class AttendanceResponse{
  @JsonKey(name: 'attendances')
  final AttendanceDetails attendances;

  @JsonKey(name: 'result')
  final String result;

  AttendanceResponse(this.attendances, this.result);

  factory AttendanceResponse.fromJson(Map<String,dynamic> json) => _$AttendanceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceResponseToJson(this);


}
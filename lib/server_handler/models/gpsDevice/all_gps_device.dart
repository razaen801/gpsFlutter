import 'package:json_annotation/json_annotation.dart';
import 'package:my_gps_app/server_handler/models/allLocations/location_detail.dart';
import 'package:my_gps_app/server_handler/models/gpsDevice/gps_devices.dart';

part 'all_gps_device.g.dart';

@JsonSerializable()
class AllGpsLocationResponse{
  @JsonKey(name: 'devices')
  final List<GpsLocationDetail> details;

  @JsonKey(name: 'status')
  final String status;

  AllGpsLocationResponse(this.details, this.status);

  factory AllGpsLocationResponse.fromJson(Map<String,dynamic> json) => _$AllGpsLocationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AllGpsLocationResponseToJson(this);


}
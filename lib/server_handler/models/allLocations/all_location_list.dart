  import 'package:json_annotation/json_annotation.dart';
  import 'package:my_gps_app/server_handler/models/allLocations/location_detail.dart';

  part 'all_location_list.g.dart';

  @JsonSerializable()
  class AllLocationResponse{
    @JsonKey(name: 'details')
    final List<LocationDetail> details;

    @JsonKey(name: 'status')
    final String status;

    AllLocationResponse(this.details, this.status);

    factory AllLocationResponse.fromJson(Map<String,dynamic> json) => _$AllLocationResponseFromJson(json);

    Map<String, dynamic> toJson() => _$AllLocationResponseToJson(this);


  }
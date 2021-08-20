import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'gps_devices.g.dart';

@JsonSerializable()
class GpsLocationDetail extends Equatable{

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  GpsLocationDetail(this.id, this.name);

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    name,
  ];

  factory GpsLocationDetail.fromJson(Map<String, dynamic> json) => _$GpsLocationDetailFromJson(json);

  Map<String,dynamic> toJson() => _$GpsLocationDetailToJson(this);


}

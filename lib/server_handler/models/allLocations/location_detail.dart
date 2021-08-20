import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'location_detail.g.dart';

@JsonSerializable()
class LocationDetail extends Equatable{
  @JsonKey(name: "created_at")
  final DateTime createdAt;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'lng')
  final double lng;

  @JsonKey(name: 'lat')
  final double lat;

  LocationDetail(this.createdAt, this.id, this.name, this.lng, this.lat);

  @override
  // TODO: implement props
  List<Object?> get props => [
    createdAt,
    id,
    name,
    lng,
    lat
  ];

  factory LocationDetail.fromJson(Map<String, dynamic> json) => _$LocationDetailFromJson(json);

  Map<String,dynamic> toJson() => _$LocationDetailToJson(this);


}

import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'attendance_details.g.dart';

@JsonSerializable(nullable: true)
class AttendanceDetails extends Equatable{

  @JsonKey(name: 'user_id')
  final int? user_id;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'attendance_id')
  final int? attendance_id;

  @JsonKey(name: 'date')
  final String date;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'email')
  final String? email;
  //
  // @JsonKey(name: 'attendance')
  // final String attendance;

  @JsonKey(name: 'checkin')
  final String? checkin;

  @JsonKey(name: 'checkout')
  final String? checkout;

  @JsonKey(name: 'checkin_location')
  final String checkin_location;


  @JsonKey(name: 'checkout_location')
  final String checkout_location;

  @JsonKey(name: 'note')
  final String? note;

  @JsonKey(name: 'updated_at')
  final String updated_at;


  @JsonKey(name: 'created_at')
  final String created_at;


  AttendanceDetails(
      this.user_id,
      this.id,
      this.attendance_id,
      this.date,
      this.name,
      this.email,
      // this.attendance,
      this.checkin,
      this.checkout,
      this.checkin_location,
      this.checkout_location,
      this.note,
      this.updated_at,
      this.created_at);

  @override
  // TODO: implement props
  List<Object?> get props => [
    user_id,
    date,
    name,
    // attendance,
    checkin,
    checkin_location,
    note,
    updated_at,
    created_at,
    email,
    id,
    checkout,
    checkout_location,
    attendance_id,
  ];

  factory AttendanceDetails.fromJson(Map<String, dynamic> json) => _$AttendanceDetailsFromJson(json);

  Map<String,dynamic> toJson() => _$AttendanceDetailsToJson(this);


}

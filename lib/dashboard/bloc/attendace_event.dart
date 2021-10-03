part of 'attendace_bloc.dart';

@immutable
abstract class AttendaceEvent {}

class CheckInOutUser extends AttendaceEvent{
  final String type;
  CheckInOutUser({required this.type});

  @override
  // TODO: implement props
  List<Object> get props => [type];
}

class PanicInit extends AttendaceEvent{}

class SubmitPanicDetails extends AttendaceEvent{
  final String name;
  final String email;
  final String phone;
  final String type;
  final String imageFile;

  SubmitPanicDetails({
      required this.name,required this.email,required this.phone,required this.type,required this.imageFile});
}

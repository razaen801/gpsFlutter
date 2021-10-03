part of 'attendace_bloc.dart';

@immutable
abstract class AttendaceState {}

class AttendaceInitial extends AttendaceState {}

class Loading extends AttendaceState{}

class PanicFormSuccess extends AttendaceState{
  final PanicResponse response;
  final String type;

  PanicFormSuccess(this.response, this.type);

  @override
  // TODO: implement props
  List<Object> get props => [response,type];

}

class CheckInOutSuccess extends AttendaceState{
  final AttendanceDetails details;
  final String type;

  CheckInOutSuccess(this.details, this.type);

  @override
  // TODO: implement props
  List<Object> get props => [details,type];

}

class NetworkError extends AttendaceState {
  final String errorMessage;

  NetworkError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() =>
      '$errorMessage';
}


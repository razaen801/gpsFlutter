part of 'google_map_bloc.dart';

@immutable
abstract class GoogleMapState {}

class GoogleMapInitial extends GoogleMapState {}

class MapLocationsFetched extends GoogleMapState{
  final List<LocationDetail> locationDetails;

  MapLocationsFetched(this.locationDetails);

  @override
  List<Object> get props => [locationDetails];
}
class Loading extends GoogleMapState{

}
class GpsFetchError extends GoogleMapState{
  final String eMessage;

  GpsFetchError(this.eMessage);

  @override
  List<Object> get props => [eMessage];

  @override
  String toString() =>
      '$eMessage';
}
class GpsLocationsFetched extends GoogleMapState{
  final List<GpsLocationDetail> gpsLocationDetails;

  GpsLocationsFetched(this.gpsLocationDetails);



  @override
  List<Object> get props => [gpsLocationDetails];
}

class MapListError extends GoogleMapState {
  final String errorMessage;

  MapListError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() =>
      '$errorMessage';
}
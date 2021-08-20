part of 'google_map_bloc.dart';

@immutable
abstract class GoogleMapEvent {}

class MapDataRequest extends GoogleMapEvent{}
class GpsDevicesRequest extends GoogleMapEvent{}

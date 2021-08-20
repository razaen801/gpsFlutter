import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:my_gps_app/server_handler/models/allLocations/location_detail.dart';
import 'package:my_gps_app/server_handler/models/gpsDevice/gps_devices.dart';
import 'package:my_gps_app/server_handler/network/network_repository.dart';
import 'package:my_gps_app/utility/shared_preferences_helper.dart';
import 'package:my_gps_app/server_handler/network/network_data_source.dart';


part 'google_map_event.dart';
part 'google_map_state.dart';

class GoogleMapBloc extends Bloc<GoogleMapEvent, GoogleMapState> {
  GoogleMapBloc() : super(GoogleMapInitial());

  @override
  Stream<GoogleMapState> mapEventToState(
    GoogleMapEvent event,
  ) async* {
    print('mapbloc');
    if(event is MapDataRequest){
      NetworkDataSource repository = NetworkRepository();
      String token = await RaSharedPreferenceConfig.getToken();
      print('requesting map locations');
      try{
        var response =await repository.getAllDeviceLocation(token);
        if(response?.details?.isEmpty ?? true){
          print('requesting map locations failed');
          yield MapListError("Unable to fetch details");
        }
        else{
          print('requesting map locations succcess');
          yield MapLocationsFetched(response.details);
        }
      }
      on DioError catch(e){
        print('requesting map locations failed');

        if (e.type == DioErrorType.connectTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          yield MapListError("Connection Error");
        }
        else if (e.type == DioErrorType.other) {
          yield MapListError("No Internet Connection");
        } else {
          yield MapListError(e.toString());
        }
      }

    }
    else  if(event is GpsDevicesRequest){
      print('requesting devices');

      NetworkDataSource repository = NetworkRepository();
      String token = await RaSharedPreferenceConfig.getToken();
      try{
        print('requesting device');
        var response =await repository.getAllGpsDevice(token);
        if(response?.details?.isEmpty ?? true){
          print('requesting device failed');

          yield GpsFetchError("Unable to fetch details");
        }
        else{
          print('requesting device success');
          yield GpsLocationsFetched(response.details);
        }
      }
      on DioError catch(e){
        print('requesting device failed');
        if (e.type == DioErrorType.connectTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          yield GpsFetchError("Connection Error");
        }
        else if (e.type == DioErrorType.other) {
          yield GpsFetchError("No Internet Connection");
        } else {
          yield GpsFetchError(e.toString());
        }
      }

    }
    // TODO: implement mapEventToState
  }
}

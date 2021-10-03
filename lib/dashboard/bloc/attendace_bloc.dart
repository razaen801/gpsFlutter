import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';
import 'package:my_gps_app/server_handler/models/attendance/attendance_details.dart';
import 'package:my_gps_app/server_handler/models/panic/panic_response.dart';
import 'package:my_gps_app/server_handler/network/network_repository.dart';
import 'package:my_gps_app/utility/shared_preferences_helper.dart';
import 'package:my_gps_app/server_handler/network/network_data_source.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../constants.dart';

part 'attendace_event.dart';

part 'attendace_state.dart';

class AttendaceBloc extends Bloc<AttendaceEvent, AttendaceState> {
  final BuildContext context;

  AttendaceBloc(this.context) : super(AttendaceInitial());

  @override
  Stream<AttendaceState> mapEventToState(AttendaceEvent event,) async* {
    NetworkDataSource repository = NetworkRepository();
    if (event is CheckInOutUser) {
      yield Loading();
      if (await checkLocationPermission(context, false)) {
        // String userId;
        // userId = await RaSharedPreferenceConfig.getUserDetails();
        LocationData locationData = await getLocation();
        List<String> location = [];
        location.add(locationData.longitude.toString());
        location.add(locationData.latitude.toString());
        try {
          var response = await repository.checkInOutUser(
              await RaSharedPreferenceConfig.getToken(),
              await RaSharedPreferenceConfig.getUserDetails(),
              location.toString(),
              event.type);
          if (response?.result == "success") {
            yield CheckInOutSuccess(response.attendances, event.type);
          }
          else {
            yield NetworkError(response.toString());
          }
        } on DioError catch (e) {
          print(e);
          if (e.type == DioErrorType.connectTimeout ||
              e.type == DioErrorType.receiveTimeout) {
            yield NetworkError("Connection Error");
          }
          else if (e.type == DioErrorType.other) {
            yield NetworkError("Connection error");
          } else {
            yield NetworkError("Failed. Please try again!");
          }
        }
        catch (e) {
          yield NetworkError(e.toString());
          print(e);
        }
      }
      // TODO: implement mapEventToState
    }
    else if (event is PanicInit) {
      await checkLocationPermission(context, false);
    }
    else if (event is SubmitPanicDetails) {
      yield Loading();
      if (await checkLocationPermission(context, false)) {
        LocationData locationData = await getLocation();
        List<String> location = [];
        location.add(locationData.longitude.toString());
        location.add(locationData.latitude.toString());

        try {
          var response = await repository.submitPanicForm(
                    event.name,
                    event.email,
                    event.phone,
                    location.toString(),
                    "",
                    event.type
                  );
         if(response.result=="success"){
            yield PanicFormSuccess(response, event.type);
          }
          else{
            yield NetworkError("Connection Failed");
          }

        } on DioError catch (e) {
          print(e);
          if (e.type == DioErrorType.connectTimeout ||
              e.type == DioErrorType.receiveTimeout) {
            yield NetworkError("Connection Error");
          }
          else if (e.type == DioErrorType.other) {
            yield NetworkError("Connection error");
          } else {
            yield NetworkError("Failed. Please try again!");
          }
        }
        catch (e) {
          yield NetworkError(e.toString());
          print(e);
        }
      }
    }
  }
}
import 'package:flutter/services.dart';
import 'package:my_gps_app/server_handler/models/allLocations/all_location_list.dart';
import 'package:my_gps_app/server_handler/models/allMessages/message_response.dart';
import 'package:my_gps_app/server_handler/models/attendance/attendance_response.dart';
import 'package:my_gps_app/server_handler/models/expenses/expense_response.dart';
import 'package:my_gps_app/server_handler/models/gpsDevice/all_gps_device.dart';
import 'package:my_gps_app/server_handler/models/panic/panic_response.dart';
import 'package:my_gps_app/server_handler/models/submitLocationResponse/submit_location_response.dart';

abstract class NetworkDataSource{
  Future<SubmitLocationResponse> submitLocation(String token, String id, double longitude, double latitude);

  Future<AllLocationResponse> getAllDeviceLocation(String token);

  Future<AllGpsLocationResponse> getAllGpsDevice(String token);

  Future<MessageResponse> getMessages(String token);

  Future<AttendanceResponse> getCurrentUser(String token, String user_id);

  Future<AttendanceResponse> checkInOutUser(String token, String user_id, String location, String type);

  Future<ExpenseResponse> getAllExpenses();

  Future<PanicResponse> submitPanicForm(String name, String email, String phone, String location, String image, String type);


}
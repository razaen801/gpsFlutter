import 'package:my_gps_app/server_handler/models/allLocations/all_location_list.dart';
import 'package:my_gps_app/server_handler/models/allMessages/message_response.dart';
import 'package:my_gps_app/server_handler/models/attendance/attendance_response.dart';
import 'package:my_gps_app/server_handler/models/expenses/expense_response.dart';
import 'package:my_gps_app/server_handler/models/gpsDevice/all_gps_device.dart';
import 'package:my_gps_app/server_handler/models/panic/panic_response.dart';
import 'package:my_gps_app/server_handler/models/submitLocationResponse/submit_location_response.dart';
import 'package:my_gps_app/server_handler/network/network_api_client.dart';
import 'package:my_gps_app/server_handler/network/network_data_source.dart';
import 'package:dio/dio.dart';
import 'package:my_gps_app/utility/shared_preferences_helper.dart';


class NetworkRepository extends NetworkDataSource{
  late Dio dio;
  late NetworkApiClient networkApiClient;

  NetworkRepository(){
    dio = Dio();
    networkApiClient = NetworkApiClient(dio);
  }

  @override
  Future<SubmitLocationResponse> submitLocation(String token,String id, double longitude, double latitude) {
    return networkApiClient.submitLocation(token,id, longitude, latitude);
  }

  @override
  Future<AllLocationResponse> getAllDeviceLocation(String token) {
    return networkApiClient.getAllLocation(token);
  }

  @override
  Future<AllGpsLocationResponse> getAllGpsDevice(String token) {
    return networkApiClient.getAllGpsDevice(token);
    // TODO: implement getAllGpsDevice
    throw UnimplementedError();
  }

  @override
  Future<AttendanceResponse> checkInOutUser(String token, String user_id, String location,String type) {
    if(type=="checkin"){
      return networkApiClient.checkInUser(user_id, type, "1", location);
    }
    else{
      return networkApiClient.checkOutUser(user_id, type, "1", location);

    }
    // TODO: implement checkInOutUser
    throw UnimplementedError();
  }

  @override
  Future<AttendanceResponse> getCurrentUser(String token, String user_id) {
    return networkApiClient.getUserDetail(user_id);
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<MessageResponse> getMessages(String token) {
    return networkApiClient.getAllMessages();
    // TODO: implement getMessages
    throw UnimplementedError();
  }

  @override
  Future<ExpenseResponse> getAllExpenses() {
    return networkApiClient.getAllExpenses();
    // TODO: implement getAllExpenses
    throw UnimplementedError();
  }

  @override
  Future<PanicResponse> submitPanicForm(String name, String email, String phone, String location, String image, String type) {
    return networkApiClient.submitPanicForm(name, email, phone, location, image, type);
    // TODO: implement submitPanicForm
    throw UnimplementedError();
  }

}
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:my_gps_app/dashboard/dashboard_home.dart';
import 'package:my_gps_app/dashboard/dashboard_list.dart';
import 'package:my_gps_app/dashboard/map/dashboard_map.dart';
import 'package:my_gps_app/dashboard/dashboard_other.dart';
import 'package:my_gps_app/dashboard/dashboard_recent.dart';
import 'package:my_gps_app/server_handler/network/network_data_source.dart';
import 'package:my_gps_app/server_handler/network/network_repository.dart';
import 'package:my_gps_app/utility/shared_preferences_helper.dart';
//
// void main(){
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Random Title',
//       home:  MyHomePage(),
//     );
//   }
// }



class MyHomePage extends StatefulWidget {
  MyHomePage({ required Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  Location location = new Location();
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  late bool _serviceEnabled;
  late String id;
  late String token;


  NetworkDataSource repository = NetworkRepository();

  final DashBoardHome dashBoardHome = new DashBoardHome();
  final DashBoardMap dashBoardMap = new DashBoardMap();
  final DashBoardList dashBoardList = new DashBoardList();
  final DashBoardRecent dashBoardRecent = new DashBoardRecent();
  final DashBoardOther dashBoardOther = new DashBoardOther();

  int _pageIndex = 1;
  Widget _showPage = new DashBoardMap();

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold);

  int count = 1;

  void showMessage(String s) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Attention"),
            actions: [
              FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("Ok"))
            ],
            content: Text(
                s),
          );
        });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    RaSharedPreferenceConfig.isSearching(false);

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    RaSharedPreferenceConfig.isSearching(true);
  }

  void getLocationAndSendToServer() async{

    token = await RaSharedPreferenceConfig.getToken();
    // id = token.split("|").first;
    // print("$id and token is $token");

    _serviceEnabled = await location.serviceEnabled();
    print('GPS location Attempt $count : service enbaled $_serviceEnabled');

    if(!_serviceEnabled){
      _serviceEnabled = await location.requestService();
      if(!_serviceEnabled){
        print('GPS location Attempt $count : Disabled');
        showMessage("Location service disabled, Please try again");
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if(_permissionGranted== PermissionStatus.denied){
      _permissionGranted = await location.requestPermission();
      if(_permissionGranted==PermissionStatus.granted){
        _locationData = await location.getLocation();
        bool searching = await RaSharedPreferenceConfig.getIsSearching();
        if(searching) {
          location.enableBackgroundMode(enable: true);
          callServer(_locationData);
        }
        else{
          location.enableBackgroundMode(enable: false);
        }
      }
      else if (_permissionGranted!=PermissionStatus.granted){
        showMessage("Location is required. Please grant location permission");
        return;
      }
    }
    else  if(_permissionGranted==PermissionStatus.granted){
      _locationData = await location.getLocation();
      location.enableBackgroundMode(enable: true);
      callServer(_locationData);
    }

  }



  void callServer(LocationData locationData) async {
    print ("Location: ${locationData.toString()} ");
    bool searching = await RaSharedPreferenceConfig.getIsSearching();
    int deviceId = await RaSharedPreferenceConfig.getDeviceId();
    if(searching && deviceId!=-1) {
      try {
        print('Requesting with device id $deviceId & ${locationData.toString()}');
        var response = await repository.submitLocation(
            "bearer $token", deviceId.toString(), locationData.longitude ?? 0,
            locationData.latitude ?? 0);
        if (response?.status?.isEmpty ?? true) {
          print('GPS location Attempt $count : Failed');
          count++;
          Timer(Duration(seconds: 12),
                  () => getLocationAndSendToServer());
        }
        else {
          print('GPS location Attempt $count : Success');
          count++;
          Timer(Duration(seconds: 12),
                  () => getLocationAndSendToServer());
        }
      } on DioError catch (e) {
        if (e.type == DioErrorType.connectTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          print('GPS location Attempt $count : Connection TimeOut Error');
          count++;
          Timer(Duration(seconds: 12),
                  () => getLocationAndSendToServer());
        }
        else {
          print('GPS location Attempt $count : $e');
          count++;
          Timer(Duration(seconds: 12),
                  () => getLocationAndSendToServer());
        }
      }
    }
    else{
      print('GPS location Attempt $count : No Device Selected');
      count++;
      Timer(Duration(seconds: 12),
              () => getLocationAndSendToServer());
    }
  }


void _onItemTapped(int index){
  setState(() {
    _selectedIndex = index;
  });
}

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return dashBoardHome;
        break;
      case 1:
        return dashBoardMap;
        break;

      case 2:
        return dashBoardList;
        break;

      case 3:
        return dashBoardRecent;
        break;

      case 4:
        return dashBoardOther;
        break;

      default:
        return new Container(
          child: Center(
            child: Text(
              "Page not found",
              style: TextStyle(fontSize: 30),
            ),
          ),
        );

    }

  }

  @override
  Widget build(BuildContext context) {
    getLocationAndSendToServer();
    return Scaffold(
      body: Container(
        child: _showPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _pageIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.blueGrey,
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
            _pageIndex = tappedIndex;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
          label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: "Map"),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "List"),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: "Report"),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.more_horiz_sharp),
          //     label: "Others"),
        ],

      ),
    );
  }


}


import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_gps_app/customColors.dart';
import 'package:my_gps_app/dashboard/map/google_map_bloc.dart';
import 'package:my_gps_app/server_handler/models/allLocations/all_location_list.dart';
import 'package:my_gps_app/server_handler/models/allLocations/location_detail.dart';
import 'package:my_gps_app/server_handler/models/gpsDevice/gps_devices.dart';
import 'package:my_gps_app/server_handler/network/network_repository.dart';
import 'package:my_gps_app/toolbar/toolbar_home.dart';
import 'package:my_gps_app/server_handler/network/network_data_source.dart';
import 'package:my_gps_app/utility/shared_preferences_helper.dart';
import 'package:my_gps_app/widgets/loading_dialog.dart';

class DashboardMapNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoogleMapBloc(),
      child: DashBoardMap(),
    );
  }
}


class DashBoardMap extends StatefulWidget {
  @override
  _DashBoardMapState createState() => _DashBoardMapState();
}

class _DashBoardMapState extends State<DashBoardMap> {

  Completer<GoogleMapController> _controller = Completer();
  NetworkDataSource repository = NetworkRepository();
  Set<Marker> markers = Set();
  List<GpsLocationDetail> allGpsLocationDetails=[];
  GpsLocationDetail gpsLocationDetail = new GpsLocationDetail(-1, "name");
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isDeviceSelected = false;

  void setGpsLocations(List<GpsLocationDetail> locationDetails){
    allGpsLocationDetails.clear();
    allGpsLocationDetails.addAll(locationDetails);
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(27.693038, 85.281412), //long lat lla
    zoom: 12.0,
  );

  Future<AllLocationResponse> getTokenAndCall() async {
    String token = await RaSharedPreferenceConfig.getToken();
    String id = token
        .split("|")
        .first;
    print("$id and token is $token");
    return await repository.getAllDeviceLocation(token);
  }

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  void addMarkerToGoogleMap(List<LocationDetail> locationDetails) {
    for (LocationDetail locationDetail in locationDetails) {
      Marker resultMarker = Marker(
        markerId: MarkerId(locationDetail.id.toString()),
        infoWindow: InfoWindow(
          title: "${locationDetail.name}",
        ),
        position: LatLng(
            // locationDetail.lat, locationDetail.lng),
            double.parse(locationDetail.lat), double.parse(locationDetail.lng)),
      );

      markers.add(resultMarker);
    }
  }


  void showDialogWithMessage(String title, String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Ok"))
            ],
            content: Text(message),
          );
        });
  }

  void showToastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: CustomColors.kButtonColor,
        fontSize: 15.0
    );

  }

  void showDeviceListAndSelect() async{
    String deviceName = await RaSharedPreferenceConfig.getDeviceName();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Select Device ( $deviceName selected)'),
            content: setupAlertDialogContainer(),
          );
        });
  }

  Widget setupAlertDialogContainer() {
    return Container(
      height: 300.0, // Change as per your requirement
      width: 300.0, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: allGpsLocationDetails.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: GestureDetector(
              onTap: (){
                Navigator.pop(context);
                showToastMessage('Device ${allGpsLocationDetails[index].name} selected! ');
                setDeviceId(allGpsLocationDetails[index]);
                setState(() {
                  gpsLocationDetail = allGpsLocationDetails[index];
                });
              },
                child: Text(allGpsLocationDetails[index].name)
            ),
          );
        },
      ),
    );
  }

  void setDeviceId (GpsLocationDetail gpsLocationDetail) async {
    await RaSharedPreferenceConfig.setDeviceId(gpsLocationDetail.id);
    await RaSharedPreferenceConfig.setDeviceName(gpsLocationDetail.name);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showInitialSnackbar();
  }


  void showInitialSnackbar() async {
    gpsLocationDetail = new GpsLocationDetail(await RaSharedPreferenceConfig.getDeviceId(),await RaSharedPreferenceConfig.getDeviceName());

    setState(() {
      if(gpsLocationDetail.id!=-1){
        isDeviceSelected = true;
      }
      else{
        isDeviceSelected = false;
      }
    });

    _scaffoldKey.currentState!.showSnackBar(SnackBar(content: new Text(gpsLocationDetail.id!=-1?"Locating ${gpsLocationDetail.name}"
        :"Please select device first!"
    )));
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 100;
    double height = MediaQuery.of(context).size.height / 100;
    var mediaQuery = MediaQuery.of(context);

    // BlocProvider.of<GoogleMapBloc>(context).add(MapDataRequest());

    context.read<GoogleMapBloc>().add(MapDataRequest());
    context.read<GoogleMapBloc>().add(GpsDevicesRequest());
    return BlocListener<GoogleMapBloc, GoogleMapState>(
      listener: (context, state) {
        if(state is Loading){
          LoadingDialog.show(context, key: new ObjectKey("loading"));
        }
        else if(state is GpsLocationsFetched){
          print('devices fetched to ui');
          // LoadingDialog.hide(context);
          setGpsLocations(state.gpsLocationDetails);
        }
        else   if (state is MapLocationsFetched) {
          print('locations fetched to ui');
          addMarkerToGoogleMap(state.locationDetails);
          Timer(Duration(seconds: 22),
                  () => context.read<GoogleMapBloc>().add(MapDataRequest()));
        }
        else if (state is MapListError) {
           AlertDialog(
            title: Text("Sorry"),
            content: Text(state.errorMessage),
            actions: [
              FlatButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text("OK"))
            ],
          );
        }

        else if(state is GpsFetchError){
          LoadingDialog.hide(context);
          showDialogWithMessage("Sorry", state.eMessage);
        }
        else{
          LoadingDialog.hide(context);
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: AppBarTitle(),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,

        ),

        floatingActionButton: Container(
          margin: EdgeInsets.only(right: 40),
          width: width*20,
          height: height*7,
          child: FittedBox(
            fit: BoxFit.contain,
            child: FloatingActionButton(
              backgroundColor: CustomColors.kButtonColor,
              // shape: BeveledRectangleBorder(
              //   borderRadius: BorderRadius.circular(8),
              // ),
              child:
                Icon(isDeviceSelected?Icons.done:Icons.device_unknown_outlined),
                 // Row(
              //   children: [
              //     Icon(Icons.navigation,color: Colors.white,),
              //     Text("Select Devices",style: TextStyle(
              //       color: Colors.white
              //     ),),
              //   ],

              onPressed: (){
                showDeviceListAndSelect();
              },
            ),
          ),
        ),

        body:
        Container(
          child: BlocBuilder<GoogleMapBloc, GoogleMapState>(
            builder: (context, state) {

              return
                GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: _kGooglePlex,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  markers: markers,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }





}



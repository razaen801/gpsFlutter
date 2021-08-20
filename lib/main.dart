import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gps_app/dashboard/map/google_map_bloc.dart';
import 'package:my_gps_app/login/bloc/login_bloc.dart';
import 'package:my_gps_app/login/loginPage.dart';
import 'package:my_gps_app/server_handler/login/login_repository.dart';
import 'package:my_gps_app/splash/splashScreen.dart';
import 'package:my_gps_app/splashscn.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GoogleMapBloc()),
        BlocProvider(create: (context) => LoginBloc(repository: LoginRepository())),
      ],
        child: new MaterialApp(
          // home: new splashscn(key: ObjectKey("splash"),),
          home: new SplashScreenView(),
        ));
  }
}

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/login/loginPage.dart';

class SplashScreenView extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreenView>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2),
    ()=> Navigator.of(context).pushReplacement(MaterialPageRoute(
    builder: (BuildContext context) =>MyApp())));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Image.asset("assets/images/background.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }


}
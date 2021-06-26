import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/login.dart';
import 'package:my_gps_app/login/loginPage.dart';
import 'package:my_gps_app/login/login_new.dart';

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
    builder: (BuildContext context) =>LoginPageNew(key: ObjectKey("login"),))));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width/100;
    double height= MediaQuery.of(context).size.height/100;
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            // color: const Color(0xff3676a7),
            image: DecorationImage(
              image: AssetImage("assets/images/splash_back.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset("assets/images/main_logo.png",
            // width: double.infinity,
            // height: double.infinity,
            ),
          ),
        ),
      ),
    );
  }


}
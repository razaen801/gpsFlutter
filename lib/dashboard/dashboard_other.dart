import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/toolbar/toolbar_home.dart';

class DashBoardOther extends StatefulWidget {
  @override
  _DashBoardOtherState createState() => _DashBoardOtherState();
}

class _DashBoardOtherState extends State<DashBoardOther> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(),
          backgroundColor: Colors.white,

        ),
        body: Container(

        )
    );
  }
}

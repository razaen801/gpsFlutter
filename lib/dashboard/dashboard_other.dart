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
    double width = MediaQuery.of(context).size.width/100;
    double height = MediaQuery.of(context).size.height/100;
    return Scaffold(
        appBar: AppBar(
          title: AppBarTitle(),
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Row(
              children: [
                Container(
                  // decoration:,
                  child: Column(
                    children: [
                    ],
                  ),
                )
              ],
            ),

          ),
        ),
    );
  }
}

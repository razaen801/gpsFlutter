import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/toolbar/toolbar_home.dart';

class DashBoardRecent extends StatefulWidget {
  @override
  _DashBoardRecentState createState() => _DashBoardRecentState();
}

class _DashBoardRecentState extends State<DashBoardRecent> {
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

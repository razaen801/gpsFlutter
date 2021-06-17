import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/toolbar/toolbar_home.dart';

class DashBoardList extends StatefulWidget {
  @override
  _DashBoardListState createState() => _DashBoardListState();
}

class _DashBoardListState extends State<DashBoardList> {
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


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardMain extends StatefulWidget{
  @override
  _DashBoardMain createState() => _DashBoardMain();
}

class _DashBoardMain extends State<DashboardMain>{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: SafeArea(
        child: Scaffold(

        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }


}

class MyNavigationBar extends StatefulWidget{
  _MyNaviagationBarState createState()=> _MyNaviagationBarState();
}

class _MyNaviagationBarState extends State<MyNavigationBar>{
  int selectedIndex = 0;
  static const List<Widget> _widgetOption = <Widget>[
    Text("Home")
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }


}
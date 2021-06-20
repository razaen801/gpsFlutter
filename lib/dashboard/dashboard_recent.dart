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
    double width = MediaQuery
        .of(context)
        .size
        .width / 100;
    double height = MediaQuery
        .of(context)
        .size
        .height / 100;
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.all(Radius.circular(4)),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            shape: BoxShape.circle
                        ),
                        child: SizedBox(
                            height: height * 8,
                            width: width * 10,
                            child: Icon(Icons.play_arrow_outlined,
                              color: Colors.white,)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Detail Report",
                        style: TextStyle(
                            fontSize: 16
                        ),),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.all(Radius.circular(4)),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.lightGreenAccent,
                            shape: BoxShape.circle
                        ),
                        child: SizedBox(
                            height: height * 8,
                            width: width * 10,
                            child: Icon(Icons.location_on_outlined,
                              color: Colors.white,)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Distance Report",
                        style: TextStyle(
                            fontSize: 16
                        ),),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.all(Radius.circular(4)),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            shape: BoxShape.circle
                        ),
                        child: SizedBox(
                            height: height * 8,
                            width: width * 10,
                            child: Icon(Icons.calendar_today,
                              color: Colors.white,)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Daily Distance",
                        style: TextStyle(
                            fontSize: 16
                        ),),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.all(Radius.circular(4)),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            shape: BoxShape.circle
                        ),
                        child: SizedBox(
                            height: height * 8,
                            width: width * 10,
                            child: Icon(Icons.speed_sharp,
                              color: Colors.white,)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Over Speed Report",
                        style: TextStyle(
                            fontSize: 16
                        ),),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.all(Radius.circular(4)),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle
                        ),
                        child: SizedBox(
                            height: height * 8,
                            width: width * 10,
                            child: Icon(Icons.double_arrow,
                              color: Colors.white,)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Last Location report",
                        style: TextStyle(
                            fontSize: 16
                        ),),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.all(Radius.circular(4)),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle
                        ),
                        child: SizedBox(
                            height: height * 8,
                            width: width * 10,
                            child: Icon(Icons.forward,
                              color: Colors.white,)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Halt Report",
                        style: TextStyle(
                            fontSize: 16
                        ),),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadiusDirectional.all(Radius.circular(4)),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle
                        ),
                        child: SizedBox(
                            height: height * 8,
                            width: width * 10,
                            child: Icon(Icons.insert_drive_file,
                              color: Colors.white,)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Summary Report",
                        style: TextStyle(
                            fontSize: 16
                        ),),
                    )
                  ],
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}

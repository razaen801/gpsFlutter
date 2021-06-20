import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadiusDirectional.all(Radius.circular(4)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            shape: BoxShape.circle
                        ),
                        child: SizedBox(
                            height: height*8,
                            width: width*10,
                            child: Icon(Icons.stop,
                            color: Colors.white,)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Stop/Resume Vehicle"),
                      )
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

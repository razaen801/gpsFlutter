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
          automaticallyImplyLeading: false,

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
                              color: Colors.deepPurple,
                              shape: BoxShape.circle
                          ),
                          child: SizedBox(
                              height: height*8,
                              width: width*10,
                              child: Icon(Icons.stop,
                              color: Colors.white,)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Stop/Resume Vehicle",
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
                              height: height*8,
                              width: width*10,
                              child: Icon(Icons.settings,
                              color: Colors.white,)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Settings",
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
                              height: height*8,
                              width: width*10,
                              child: Icon(Icons.remove_red_eye,
                              color: Colors.white,)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Privacy Policy",
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
                              height: height*8,
                              width: width*10,
                              child: Icon(Icons.refresh,
                              color: Colors.white,)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("History View",
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
                              color: Colors.purpleAccent,
                              shape: BoxShape.circle
                          ),
                          child: SizedBox(
                              height: height*8,
                              width: width*10,
                              child: Icon(Icons.feedback_outlined,
                              color: Colors.white,)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Feedback",
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
                              height: height*8,
                              width: width*10,
                              child: Icon(Icons.forward,
                              color: Colors.white,)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Share link track",
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
                              height: height*8,
                              width: width*10,
                              child: Icon(Icons.email,
                              color: Colors.white,)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Notification Setting",
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

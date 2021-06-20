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

    double width = MediaQuery
        .of(context)
        .size
        .width / 100;
    double height = MediaQuery
        .of(context)
        .size
        .height / 100;


    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: AppBarTitle(),
          backgroundColor: Colors.white,

        ),
        body: SingleChildScrollView(

          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: width*20,
                      height: height*4,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.red
                      ),
                      child: Center(child: Text("All 0",style: TextStyle(color: Colors.white),)),

                    ),
                    Container(
                      width: width*20,
                      height: height*4,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.green
                      ),
                      child: Center(child: Text("Idle 0",style: TextStyle(color: Colors.white),)),

                    ),
                    Container(
                      width: width*18,
                      height: height*4,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.blue
                      ),
                      child: Center(child: Text("Running 0",style: TextStyle(color: Colors.white),)),

                    ),
                    Container(
                      width: width*20,
                      height: height*4,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.grey
                      ),
                      child: Center(child: Text("Idle 0",style: TextStyle(color: Colors.white),)),

                    ),

                  ],
                ),


              ),

              SizedBox(
                width: double.infinity,
                  height: height*20,
                  child: Image.asset('assets/images/list1.png')),
              SizedBox(
                width: double.infinity,
                  height: height*20,
                  child: Image.asset('assets/images/list2.png')),
              SizedBox(
                width: double.infinity,
                  height: height*20,
                  child: Image.asset('assets/images/list3.png')
              ),


            ],

          ),

        )
    );
  }

}

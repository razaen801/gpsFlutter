import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/toolbar/toolbar_home.dart';

class DashBoardHome extends StatefulWidget {
  @override
  _DashBoardHomeState createState() => _DashBoardHomeState();
}

class _DashBoardHomeState extends State<DashBoardHome> {
  String dropDoenValue = "Select Vehicle";
  List<String> spinnerItems = ['Select Vehicle', 'Car', 'Truck', 'Bus'];

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: DropdownButton<String>(
                      value: dropDoenValue,
                      icon: Icon(Icons.arrow_drop_down),
                      items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                           value: value,
                           child: Text(value),
                            );
                           }).toList(),
                      underline: Container(
                        height: 2,
                        color: Colors.grey,
                      ),
                      style: TextStyle(color: Colors.black45, fontSize: 16),
                    ),
                  ),
                  Icon(Icons.insert_chart_outlined_outlined)
                ],
              ),


              SizedBox(
                height: height*35,
                  child: Image.asset('assets/images/chart.png')),

              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  height: height*25,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent,width: 5),
                      shape: BoxShape.circle
                  ),
                  width: width*100,
                  child: Center(
                    child: Text("1",style:
                      TextStyle(fontSize: 32),
                    ),
                  ),

                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width*15,
                    height: height*10,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle
                    ),
                    child: SizedBox(
                      width: width*12,
                      height: height*8,
                      child: Icon(
                        Icons.car_repair,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    width: width*15,
                    height: height*10,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle
                    ),
                    child: Icon(
                        Icons.bike_scooter,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    width: width*15,
                    height: height*10,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle
                    ),
                    child: Icon(
                      Icons.directions_bus,
                      color: Colors.white,
                    ),
                  ),

                  Container(
                    width: width*15,
                    height: height*10,
                    decoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        shape: BoxShape.circle
                    ),
                    child: Icon(
                      Icons.bus_alert,
                      color: Colors.white,
                    ),
                  ),

                  Container(
                    width: width*15,
                    height: height*10,
                    decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        shape: BoxShape.circle
                    ),
                    child: Icon(
                      Icons.electric_car_outlined,
                      color: Colors.white,
                    ),
                  ),


                ],
              )
            ],
          ),
        ));
  }
}

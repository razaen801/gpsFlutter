import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/customColors.dart';
import 'package:my_gps_app/models/list_dash_adapter.dart';
import 'package:my_gps_app/toolbar/toolbar_home.dart';
import 'package:my_gps_app/widgets/dash_list_item.dart';
import 'package:provider/provider.dart';

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

    List<ListModel> listModels = [];
    listModels.add(new ListModel.name(title: "RJ11GB4730", status: "Idle",
        speed: "0.00", drivenToday: "323.33 Km",
        iconLocation: "assets/images/list_jeep.png", location: "Unnamed Road, Thankot, Kathmandu 1245235, Nepal"));
    listModels.add(new ListModel.name(title: "RJ11GB4730", status: "Idle",
        speed: "0.00", drivenToday: "123.33 Km",
        iconLocation: "assets/images/list_car.png", location: "Unnamed Road, Thankot, Kathmandu 1245235, Nepal"));
    listModels.add(new ListModel.name(title: "RJ11GB4730", status: "Idle",
        speed: "0.00", drivenToday: "123.33 Km",
        iconLocation: "assets/images/list_truck.png", location: "Unnamed Road, Thankot, Kathmandu 1245235, Nepal"));

    return Scaffold(
      backgroundColor: CustomColors.kBoxBackgroundColor,
        appBar: AppBar(
          title: AppBarTitle(),
          // leading: AppBarTitle(),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,

        ),
        body: ListView(
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

            ListView.builder(
              shrinkWrap: true,
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context,position){
                return ChangeNotifierProvider.value(
                  child: DashListItem(),
                    value: listModels[position]
                );
                }),

            // SizedBox(
            //   width: double.infinity,
            //     height: height*20,
            //     child: Image.asset('assets/images/list1.png')),
            // SizedBox(
            //   width: double.infinity,
            //     height: height*20,
            //     child: Image.asset('assets/images/list2.png')),
            // SizedBox(
            //   width: double.infinity,
            //     height: height*20,
            //     child: Image.asset('assets/images/list3.png')
            // ),
            //

          ],

        )
    );
  }

}

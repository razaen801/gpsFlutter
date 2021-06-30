import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/customColors.dart';
import 'package:my_gps_app/models/menu_item.dart';
import 'package:my_gps_app/toolbar/toolbar_home.dart';

import '../constants.dart';

class DashBoardRecent extends StatefulWidget {
  @override
  _DashBoardRecentState createState() => _DashBoardRecentState();
}

class _DashBoardRecentState extends State<DashBoardRecent> {
  @override
  Widget build(BuildContext context) {
    List<MenuItem> menuItems = [];
    menuItems.add(new MenuItem(title: "Detail Report", iconLocation: 'assets/images/report_detail.png', color: CustomColors.app_moderate_green,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "Distance Report", iconLocation: 'assets/images/report_distance.png', color: CustomColors.app_light_green,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "Daily Distance Report", iconLocation: 'assets/images/report_daily_distance.png', color: CustomColors.app_grey,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "Over Speed Report", iconLocation: 'assets/images/report_over_speed.png', color: CustomColors.app_light_red,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "Last Location Report", iconLocation: 'assets/images/more_share_track.png', color: CustomColors.app_green,icon: Icon(Icons.speed),isIcon: false ));
    menuItems.add(new MenuItem(title: "Fuel Consumption Report", iconLocation: 'assets/images/report_fuel.png', color: CustomColors.app_light_pink ,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "Halt Report", iconLocation: 'assets/images/report_halt.png', color: CustomColors.app_dark_green,icon: Icon(Icons.speed),isIcon: false ));
    menuItems.add(new MenuItem(title: "Summary Report", iconLocation: 'assets/images/report_summary.png', color: CustomColors.app_deep_blue,icon: Icon(Icons.speed),isIcon: false ));

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
        automaticallyImplyLeading: false,
      ),
      body:
      Container(
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context,position){
            return Container(
              child:  Container(
                margin: EdgeInsets.fromLTRB(10,5,10,5),
                width: double.infinity,
                decoration: Constant.getDialogContainerStyle(10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        height: height * 6,
                        width: width * 8,
                        decoration: BoxDecoration(
                            color: menuItems[position].color,
                            shape: BoxShape.circle
                        ),
                        child: FittedBox(
                            fit: BoxFit.contain,
                            child: Image.asset(menuItems[position].iconLocation)
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(menuItems[position].title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis ,
                        style: TextStyle(
                            fontSize: 12
                        ),),
                    )
                  ],
                ),
              ),
            );
          },

        ),
      ),

    );
  }
}

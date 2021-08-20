import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/iDash/widgets/panel_sos_list.dart';
import 'package:my_gps_app/models/menu_item.dart';
import 'package:provider/provider.dart';

import '../customColors.dart';
import 'appBar/panel_primary_title.dart';

class PanelSos extends StatefulWidget {
  @override
  _PanelSosState createState() => _PanelSosState();
}

class _PanelSosState extends State<PanelSos> {
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

    List<MenuItem> menuItems = [];
    menuItems.add(new MenuItem(title: "Customer Care: Nepal Police", iconLocation: 'assets/images/panel_prahari.png', color: CustomColors.kPanelBack,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "Emergency Service: Fire Dep", iconLocation: 'assets/images/panel_prahari.png', color: CustomColors.kPanelBack,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "Emergency Service: Ambulance", iconLocation: 'assets/images/panel_prahari.png', color: CustomColors.kPanelBack,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "Emergency Service: Ambulance", iconLocation: 'assets/images/panel_prahari.png', color: CustomColors.kPanelBack,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "Emergency Service: Ambulance", iconLocation: 'assets/images/panel_prahari.png', color: CustomColors.kPanelBack,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "Emergency Service: Ambulance", iconLocation: 'assets/images/panel_prahari.png', color: CustomColors.kPanelBack,icon: Icon(Icons.speed),isIcon: false));

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/panel_back.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            AppbarPrimary(isSecondary: true,),
            Expanded(
              child: Container(
                child: ListView.builder(
                  physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    itemBuilder: (ctx,position){
                      return ChangeNotifierProvider.value(
                        value: menuItems[position],
                        child: PanelSosList(),
                      );
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/iDash/widgets/panel_address_list.dart';
import 'package:my_gps_app/models/menu_item.dart';
import 'package:provider/provider.dart';

import '../customColors.dart';
import 'appBar/panel_primary_title.dart';

class PanelSupport extends StatefulWidget {
  @override
  _PanelSupportState createState() => _PanelSupportState();
}

class _PanelSupportState extends State<PanelSupport> {


  @override
  Widget build(BuildContext context) {

    List<MenuItem> menuItems = [];
    menuItems.add(new MenuItem(title: "Company Name", iconLocation: 'assets/images/panel_company.png', color: CustomColors.kPanelBack,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "Mobile Number", iconLocation: 'assets/images/panel_phone.png', color: CustomColors.kPanelBack,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "Contact Number", iconLocation: 'assets/images/panel_phone.png', color: CustomColors.kPanelBack,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "Our Address", iconLocation: 'assets/images/panel_address.png', color: CustomColors.kPanelBack,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "Open Hour", iconLocation: 'assets/images/panel_open_hour.png', color: CustomColors.kPanelBack,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "Email", iconLocation: 'assets/images/panel_email.png', color: CustomColors.kPanelBack,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "Website", iconLocation: 'assets/images/panel_website.png', color: CustomColors.kPanelBack,icon: Icon(Icons.speed),isIcon: false));

    double width = MediaQuery
        .of(context)
        .size
        .width / 100;
    double height = MediaQuery
        .of(context)
        .size
        .height / 100;
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
                margin: EdgeInsets.all(15),
                width: double.infinity,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: CustomColors.kBoxBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: ListView.builder(
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: 7,
                      itemBuilder: (ctx,position){
                      return ChangeNotifierProvider.value(
                        value: menuItems[position],
                        child: AddressList(),);
                      }
                      ),
                ),



              ),
            ),
          ],
        ),
      ),
    );
  }

}

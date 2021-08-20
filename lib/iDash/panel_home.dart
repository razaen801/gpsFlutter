import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:my_gps_app/customColors.dart';
import 'package:my_gps_app/dashboard/botom_navigation.dart';
import 'package:my_gps_app/iDash/appBar/panel_primary_title.dart';
import 'package:my_gps_app/iDash/panel_gps.dart';
import 'package:my_gps_app/iDash/panic/submit_form_with_map.dart';
import 'package:my_gps_app/iDash/panic/submit_panic_fomr.dart';
import 'package:my_gps_app/iDash/addGps/panel_add_gps_device.dart';
import 'package:my_gps_app/iDash/widgets/panel_home_icon.dart';
import 'package:my_gps_app/login/login_new.dart';
import 'package:my_gps_app/models/menu_item.dart';
import 'package:provider/provider.dart';

class PanelHome extends StatefulWidget {
  @override
  _PanelHomeState createState() => _PanelHomeState();
}
class _PanelHomeState extends State<PanelHome> {
  @override
  Widget build(BuildContext context){

    List<MenuItem> menuItems = [];
    menuItems.add(new MenuItem(title: "Ambulance", iconLocation: 'assets/images/panel_ambulance.png', color: CustomColors.kPanelBack,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "Accident", iconLocation: 'assets/images/panel_accident.png', color: CustomColors.kPanelBack,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "Damkal", iconLocation: 'assets/images/panel_damkal.png', color: CustomColors.kButtonColor,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "Fire", iconLocation: 'assets/images/panel_fire.png', color: CustomColors.kButtonColor,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "Earthquake", iconLocation: 'assets/images/panel_earthquake.png', color: CustomColors.kButtonColor,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "Thunder", iconLocation: 'assets/images/panel_thunder.png', color: CustomColors.kButtonColor,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "Landslide", iconLocation: 'assets/images/panel_landslide.png', color: CustomColors.kButtonColor,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "Theft", iconLocation: 'assets/images/panel_theft.png', color: CustomColors.kButtonColor,icon: Icon(Icons.speed),isIcon: false));
    menuItems.add(new MenuItem(title: "GPS", iconLocation: 'assets/images/panel_gps.png', color: CustomColors.kButtonColor,icon: Icon(Icons.speed),isIcon: false));

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
        child:
        ListView(
          physics: ScrollPhysics(),
          children: [
            AppbarPrimary(isSecondary: false,),

            GridView.builder(
              physics: ScrollPhysics(),
              // scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio:1/1.1),
                itemBuilder: (ctx,i){
                  return ChangeNotifierProvider.value(
                    value: menuItems[i],
                    child: MaterialButton(
                      onPressed: (){
                        onClickedItem(menuItems[i]);
                      } ,
                        child: PanelHomeIcon(),
                        // Container(
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     children: [
                        //       Container(
                        //         decoration: BoxDecoration(
                        //             shape: BoxShape.circle,
                        //             color: menuItems[i].color
                        //         ),
                        //         height: height*12,
                        //         width: width*20,
                        //         child: Padding(
                        //           padding: const EdgeInsets.all(18.0),
                        //           child: FittedBox(
                        //             child: Image.asset(menuItems[i].iconLocation),
                        //             fit: BoxFit.contain,
                        //           ),
                        //         ),
                        //       ),
                        //       Padding(
                        //         padding: const EdgeInsets.all(8.0),
                        //         child: Container(
                        //           decoration: BoxDecoration(
                        //               shape: BoxShape.rectangle,
                        //               borderRadius: BorderRadius.all(Radius.circular(5)),
                        //               color: Colors.white
                        //           ),
                        //           child: Padding(
                        //             padding: const EdgeInsets.fromLTRB(14.0,5,14,5),
                        //             child: Text(menuItems[i].title),
                        //           ),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // ),
                    ),
                  );
                }
                ),
          ],
        ),
      ),
    );
  }

  onClickedItem(MenuItem menuItem) {
    if(menuItem.title=="GPS"){
      Navigator.push(context, new MaterialPageRoute(
          builder: (context) => PanelAddGpsDevice()));
    }
    else {
      Navigator.push(context, new MaterialPageRoute(
          builder: (context) => PanicMapForm(type: menuItem,)));
    }


    // if(i==8){
    //   Navigator.push(context, new MaterialPageRoute(builder: (context)=> LoginPageNew(key: ObjectKey("login"))));
    // }
    // switch(i) {
    //   case 8:
    //     Navigator.push(context, new MaterialPageRoute(builder: (context)=> LoginPageNew(key: ObjectKey("login"))));
    //     break;
    //     // return false;
    //   default:
    //     break;
    // }

  }
}

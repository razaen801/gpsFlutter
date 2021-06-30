import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/customColors.dart';
import 'package:my_gps_app/models/menu_item.dart';
import 'package:provider/provider.dart';

class PanelSosList extends StatelessWidget {
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
    final MenuItem menuItem = Provider.of<MenuItem>(context,listen: false);
    return Container(
      margin: EdgeInsets.fromLTRB(20,5,30,5),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: CustomColors.kBoxBackgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0,20,12,10),
            child: Container(
              width: width*25,
                height: height*12.5,
                child: FittedBox(
                  fit: BoxFit.fill,
                    child: Image.asset(menuItem.iconLocation)
                )
            ),
          ),

          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,8,8,0),
                  child: SizedBox(
                      child: Image.asset('assets/images/panel_share.png'),
                    width: 25,
                    height: 25,
                  ),
                ),
                Container(
                  
                  width: width*50,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10,4,25,4),
                    child: Text(menuItem.title),
                  ),
                ),
                Container(
                  width: width*50,
                  margin: EdgeInsets.fromLTRB(10,0,10,10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10,4,25,4),
                    child: Text('Phone number: 01-*******'),
                  ),
                ),
                Container(
                  width: width*50,
                  margin: EdgeInsets.fromLTRB(10,0,10,20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10,4,25,4),
                    child: Text('Address: Ktm,Nepal'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),

    );
  }
}

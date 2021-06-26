import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/constants.dart';
import 'package:my_gps_app/customColors.dart';

class AppBarTitle extends StatelessWidget {
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
    return Container(
      color: Colors.white,

      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: Constant.appBarSize,
              width: Constant.appBarSize,
              child: Image.asset('assets/images/dash_logo.png')),

          Container(
            width: width*40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween                                                           ,
              children: [
                Container(
                  height: Constant.appBarSize,
                  width: Constant.appBarSize,
                  child: Icon(
                    Icons.search,
                    color: CustomColors.iconColor,
                  )
                ),
                Container(
                  height: Constant.appBarSize,
                  width: Constant.appBarSize,
                  child: Icon(
                    Icons.notifications_on_outlined,
                    color: CustomColors.iconColor,
                  )
                ),
                Container(
                  height: Constant.appBarSize,
                  width: Constant.appBarSize,
                  child: Icon(
                    Icons.account_circle,
                    color: CustomColors.iconColor,
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


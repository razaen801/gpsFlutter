import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/constants.dart';
import 'package:my_gps_app/customColors.dart';
import 'package:my_gps_app/widgets/dialog_leading.dart';
import 'package:my_gps_app/widgets/dialog_notification.dart';
import 'package:my_gps_app/widgets/dialog_profile.dart';

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

      // padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              showGeneralDialog(
                barrierLabel: "Label",
                barrierDismissible: true,
                barrierColor: Colors.black.withOpacity(0.2),
                transitionDuration: Duration(milliseconds: 300),
                context: context,
                pageBuilder: (context, anim1, anim2) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: height*68,
                      width: width*80,
                      child: SizedBox.expand(child: DialogLeading()),
                      margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
                      decoration: BoxDecoration(
                        color: CustomColors.kBoxBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
                transitionBuilder: (context, anim1, anim2, child) {
                  return SlideTransition(
                    position: Tween(begin: Offset(0, 0), end: Offset(0, 0.1)).animate(anim1),
                    child: child,
                  );
                },
              );
            },
            child: SizedBox(
              height: Constant.appBarSize,
                width: Constant.appBarSize,
                child: Image.asset('assets/images/dash_logo.png')),
          ),

          Container(
            width: width*35,
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
                GestureDetector(
                  onTap: (){
                    showGeneralDialog(
                      barrierLabel: "Label",
                      barrierDismissible: true,
                      barrierColor: Colors.black.withOpacity(0.2),
                      transitionDuration: Duration(milliseconds: 300),
                      context: context,
                      pageBuilder: (context, anim1, anim2) {
                        return Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: height*20,
                            width: width*50,
                            child: SizedBox.expand(child: DialogNotification()),
                            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
                            decoration: BoxDecoration(
                              color: CustomColors.kBoxBackgroundColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      },
                      transitionBuilder: (context, anim1, anim2, child) {
                        return SlideTransition(
                          position: Tween(begin: Offset(0, 0), end: Offset(0, 0.1)).animate(anim1),
                          child: child,
                        );
                      },
                    );
                  },
                  child: Container(
                    height: Constant.appBarSize,
                    width: Constant.appBarSize,
                    child: Icon(
                      Icons.notifications_on_outlined,
                      color: CustomColors.iconColor,
                    )
                  ),
                ),
                GestureDetector(
                  onTap: (){
                      showGeneralDialog(
                      barrierLabel: "Label",
                      barrierDismissible: true,
                      barrierColor: Colors.black.withOpacity(0.2),
                      transitionDuration: Duration(milliseconds: 300),
                      context: context,
                      pageBuilder: (context, anim1, anim2) {
                        return Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            height: height*30,
                            width: width*50,
                            child: SizedBox.expand(child: ProfileDialog()),
                            margin: EdgeInsets.only(bottom: 50, left: 12, right: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        );
                      },
                      transitionBuilder: (context, anim1, anim2, child) {
                        return SlideTransition(
                          position: Tween(begin: Offset(0, 0), end: Offset(0, 0.1)).animate(anim1),
                          child: child,
                        );
                      },
                    );
                  },
                  child: Container(
                    height: Constant.appBarSize,
                    width: Constant.appBarSize,
                    child: Icon(
                      Icons.account_circle,
                      color: CustomColors.iconColor,
                    )
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


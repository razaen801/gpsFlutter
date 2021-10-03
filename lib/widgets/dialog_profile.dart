import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:my_gps_app/constants.dart';
import 'package:my_gps_app/iDash/main_panel.dart';
import 'package:my_gps_app/server_handler/login/login_user_details.dart';
import 'package:my_gps_app/utility/shared_preferences_helper.dart';
import 'package:my_gps_app/widgets/dialog_change_password.dart';
import 'package:my_gps_app/widgets/dialog_change_pp.dart';
import 'package:my_gps_app/widgets/dialog_utils.dart';
import 'package:my_gps_app/widgets/loading_dialog.dart';

import '../customColors.dart';

class ProfileDialog extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 100;
    double height = MediaQuery.of(context).size.height / 100;

    logoutSystem() {
      Navigator.of(context).pop(true);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  PanelMain()));
    }


    return Material(
      color: Colors.transparent,
      child:  Container(
        width: width * 50,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(17)),
          color: CustomColors.kBoxBackgroundColor,
        ),
        height: height * 30,
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
                      height: height * 2,
                      width: width * 35,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.all(Radius.circular(3)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                offset: Offset(0, 2))
                          ]),
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              Text(
                                'Username: ',
                                maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                              Text(
                                "SuperAdmin",
                                maxLines: 1,
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(5),
                      width: width * 35,
                      height: height * 2,
                      decoration: Constant.dialogContainerStyle,
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Padding(
                          padding:
                          const EdgeInsets.fromLTRB(4, 4, 4, 4),
                          child: Row(
                            children: [
                              Text(
                                'Name: ',
                                maxLines: 2,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                              Text(
                                'Super Admin',
                                maxLines: 2,
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: width * 10,
                  height: height * 5,
                  child: FittedBox(
                    child: Icon(
                      Icons.account_circle,
                      color: CustomColors.kButtonColor,
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.all(5),
              width: width * 45,
              height: height * 2,
              decoration: Constant.dialogContainerStyle,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                  child: Row(
                    children: [
                      Text(
                        'Email: ',
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      Text(
                        'info@superadmin.com',
                        maxLines: 2,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              width: width * 45,
              height: height * 2,
              decoration: Constant.getDialogContainerStyle(3),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                  child: Row(
                    children: [
                      Text(
                        'Number: ',
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      Text(
                        '98********',
                        maxLines: 2,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              width: width * 45,
              height: height * 2,
              decoration: Constant.dialogContainerStyle,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                  child: Row(
                    children: [
                      Text(
                        'Address: ',
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      Text(
                        'Ktm, Nepal',
                        maxLines: 2,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
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
                        height: height * 30,
                        width: width * 50,
                        child: SizedBox.expand(
                            child: DialogChangePicture()),
                        margin: EdgeInsets.only(
                            bottom: 50, left: 12, right: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    );
                  },
                  transitionBuilder: (context, anim1, anim2, child) {
                    return SlideTransition(
                      position: Tween(
                          begin: Offset(0, 0),
                          end: Offset(0, 0.1))
                          .animate(anim1),
                      child: child,
                    );
                  },
                );
              },
              child: Container(
                margin: EdgeInsets.all(5),
                width: width * 45,
                height: height * 2,
                decoration: Constant.getDialogContainerStyle(5),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                    child: Row(
                      children: [
                        Text(
                          'Change Profile/ Photo',
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
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
                        height: height * 35,
                        width: width * 50,
                        child: SizedBox.expand(
                            child: DialogChangePassword()),
                        margin: EdgeInsets.only(
                            bottom: 50, left: 12, right: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    );
                  },
                  transitionBuilder: (context, anim1, anim2, child) {
                    return SlideTransition(
                      position: Tween(
                          begin: Offset(0, 0),
                          end: Offset(0, 0.1))
                          .animate(anim1),
                      child: child,
                    );
                  },
                );
              },
              child: Container(
                margin: EdgeInsets.all(5),
                width: width * 45,
                height: height * 2,
                decoration: Constant.getDialogContainerStyle(5),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                    child: Row(
                      children: [
                        Text(
                          'Change Password',
                          maxLines: 2,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                DialogUtils.showCustomDialog(context,
                    title: "Confirm logout",
                    content: "Are you sure you want to logout?",
                    okBtnFunction: () => {

                  Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=> PanelMain()))
                    });
              },
              child: Container(
                margin: EdgeInsets.all(10),
                width: width * 20,
                height: height * 3,
                decoration: Constant.buttonDecoration,
                child: Center(
                    child: Text(
                      "Log out",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }


}

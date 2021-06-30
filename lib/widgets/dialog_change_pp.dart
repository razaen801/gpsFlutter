import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/constants.dart';

import '../customColors.dart';
import 'dialog_utils.dart';

class DialogChangePicture extends StatelessWidget {
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
    return Material(
      color: Colors.transparent,
      child: Container(
        width: width*50,
        height: height*50,
        decoration: Constant.getDialogContainerStyle(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width*30,
              height: height*10,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Icon(Icons.account_circle,color: CustomColors.kButtonColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                  Container(
                    decoration: Constant.dialogContainerStyle,
                    child: Text("Choose File"),
                  ),
                  Text("Change Photo")
                ],

              ),
            ),
            GestureDetector(
              onTap: () {
                DialogUtils.showCustomDialog(context, title: "Confirm change",
                    content: "Are you sure you want to change your profile?",
                    okBtnFunction: () => {
                      Navigator.pop(context)
                    });
              },
              child: Container(
                margin: EdgeInsets.all(10),
                width: width * 20,
                height: height * 3,
                decoration: Constant.buttonDecoration,
                child: Center(child: Text("Update",
                  style: TextStyle(color: Colors.white, fontSize: 13),)),
              ),
            )

          ],
        ),

      ),
    );
  }
}

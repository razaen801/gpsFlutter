import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/constants.dart';
import 'package:my_gps_app/customColors.dart';

class DialogNotification extends StatelessWidget {
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
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              width: double.infinity,
              decoration: Constant.dialogContainerStyle,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("Drive Slowly"),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              width: double.infinity,
              decoration: Constant.dialogContainerStyle,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("Over Speed"),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              width: double.infinity,
              decoration: Constant.dialogContainerStyle,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text("Task Completed"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

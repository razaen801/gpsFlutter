import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/login/login_new.dart';

import '../../constants.dart';

class DialogPanelLeading extends StatelessWidget {
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
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                // Navigator.push(context, new MaterialPageRoute(builder: (context)=> LoginPageNew(key: ObjectKey("login"))));
                Navigator.push(context, new MaterialPageRoute(builder: (context)=> LoginApp()));
              },
              child: Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                decoration: Constant.dialogContainerStyle,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      SizedBox(
                          height: 18,
                          width: 18,
                          child: Image.asset('assets/images/panel_login.png')),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Login"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.all(5),
                width: double.infinity,
                decoration: Constant.dialogContainerStyle,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      SizedBox(
                          height: 22,
                          width: 22,
                          child: Image.asset('assets/images/panel_register.png')),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Register"),
                      ),
                    ],
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

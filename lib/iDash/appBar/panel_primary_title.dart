import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/iDash/widgets/dialog_main_leading.dart';

import '../../customColors.dart';

class AppbarPrimary extends StatefulWidget {
  final bool isSecondary;
  AppbarPrimary({required this.isSecondary});
  @override
  _AppbarPrimaryState createState() => _AppbarPrimaryState();
}

class _AppbarPrimaryState extends State<AppbarPrimary> {

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: widget.isSecondary?MainAxisAlignment.spaceBetween:MainAxisAlignment.start,
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
                      height: height*18,
                      width: width*45,
                      child: SizedBox.expand(child: DialogPanelLeading()),
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
                    position: Tween(begin: Offset(0.1, 0), end: Offset(0.1, 0.07)).animate(anim1),
                    child: child,
                  );
                },
              );
            },
            child: Container(
              margin: EdgeInsets.all(20),
                width: width*12,
                height: width*12,
                child: FittedBox(
                  child: Image.asset('assets/images/panel_profile.png'),
                  fit: BoxFit.fill,
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: widget.isSecondary?width*45:width*55,
              child: Padding(
                padding:const EdgeInsets.all(18),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.cover,
                      child: Image.asset('assets/images/main_logo.png')),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

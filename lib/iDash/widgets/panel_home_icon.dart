import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/models/menu_item.dart';
import 'package:provider/provider.dart';

import '../../customColors.dart';

class PanelHomeIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MenuItem menuItem = Provider.of<MenuItem>(context,listen: false);

    double width = MediaQuery
        .of(context)
        .size
        .width / 100;
    double height = MediaQuery
        .of(context)
        .size
        .height / 100;

    return
      Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: menuItem.color
            ),
            height: height*12,
            width: width*20,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: FittedBox(
                child: Image.asset(menuItem.iconLocation),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10,4,10,4),
                child: AutoSizeText(menuItem.title,
                  maxLines: 1,
                  minFontSize: 9,
                  style: TextStyle(
                  fontSize: 11,
                ),),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/models/menu_item.dart';
import 'package:provider/provider.dart';

class AddressList extends StatelessWidget {
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



    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: width*11,
              height: height*5.5,
              child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(menuItem.iconLocation))),
        ),
        Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              height: height*5,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  menuItem.title,
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
              ),
            )
        ),
      ],
    );
  }
}

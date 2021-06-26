import 'package:flutter/cupertino.dart';

class AppbarPrimary extends StatefulWidget {
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

    return Container();
  }
}

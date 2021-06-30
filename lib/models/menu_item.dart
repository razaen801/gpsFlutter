import 'package:flutter/cupertino.dart';

class MenuItem with ChangeNotifier{
  String title;
  String iconLocation;
  Color color;
  Icon icon;
  bool isIcon;

  MenuItem({
    required this.title,
    required this.iconLocation,
    required this.color,
    required this.icon,
    required this.isIcon
});

}
import 'package:flutter/cupertino.dart';

class ListModel with ChangeNotifier{
  String title,status, speed, drivenToday, iconLocation, location;

  ListModel.name({required this.title, required this.status, required this.speed, required this.drivenToday,
      required this.iconLocation, required this.location});
}
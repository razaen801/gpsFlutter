import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/dashboard/dashboard_home.dart';
import 'package:my_gps_app/dashboard/dashboard_list.dart';
import 'package:my_gps_app/dashboard/dashboard_map.dart';
import 'package:my_gps_app/dashboard/dashboard_other.dart';
import 'package:my_gps_app/dashboard/dashboard_recent.dart';
//
// void main(){
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Random Title',
//       home:  MyHomePage(),
//     );
//   }
// }



class MyHomePage extends StatefulWidget {
  MyHomePage({ required Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  final DashBoardHome dashBoardHome = new DashBoardHome();
  final DashBoardMap dashBoardMap = new DashBoardMap();
  final DashBoardList dashBoardList = new DashBoardList();
  final DashBoardRecent dashBoardRecent = new DashBoardRecent();
  final DashBoardOther dashBoardOther = new DashBoardOther();

  int _pageIndex = 0;
  Widget _showPage = new DashBoardHome();

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold);


void _onItemTapped(int index){
  setState(() {
    _selectedIndex = index;
  });
}

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return dashBoardHome;
        break;
      case 1:
        return dashBoardMap;
        break;

      case 2:
        return dashBoardList;
        break;

      case 3:
        return dashBoardRecent;
        break;

      case 4:
        return dashBoardOther;
        break;

      default:
        return new Container(
          child: Center(
            child: Text(
              "Page not found",
              style: TextStyle(fontSize: 30),
            ),
          ),
        );

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _showPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _pageIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.blueGrey,
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
            _pageIndex = tappedIndex;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
          label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              label: "Map"),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "List"),
          BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: "Report"),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz_sharp),
              label: "Others"),
        ],

      ),
    );
  }

}

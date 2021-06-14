import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home',
        style: optionStyle),
    Text('Map',
        style: optionStyle),
    Text('List',
        style: optionStyle),
    Text('Report',
        style: optionStyle),
    Text('Others',
        style: optionStyle),
  ];

void _onItemTapped(int index){
  setState(() {
    _selectedIndex = index;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("NAV BAR TITLE"),
      ),
      body: Center(
        child: _widgetOptions. elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
              icon: Icon(Icons.account_circle),
              label: "others"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }

}

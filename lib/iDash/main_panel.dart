import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/customColors.dart';
import 'package:my_gps_app/iDash/panel_about_us.dart';
import 'package:my_gps_app/iDash/panel_home.dart';
import 'package:my_gps_app/iDash/panel_sos.dart';
import 'package:my_gps_app/iDash/panel_support.dart';

class PanelMain extends StatefulWidget {
  @override
  _PanelMainState createState() => _PanelMainState();
}

class _PanelMainState extends State<PanelMain> {
  final PanelHome panelHome = new PanelHome();
  final PanelAboutUs panelAboutUs = new PanelAboutUs();
  final PanelSos panelSos = new PanelSos();
  final PanelSupport panelSupport = new PanelSupport();

  int _pageIndex = 0;
  Widget _showPage = new PanelHome();


  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return panelHome;
        break;
      case 1:
        return panelAboutUs;
        break;

      case 2:
        return panelSos;
        break;

      case 3:
        return panelSupport;
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
    return SafeArea(
        child: Scaffold(
          body: _showPage,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _pageIndex,
            selectedItemColor: CustomColors.kButtonColor,
            unselectedItemColor: CustomColors.app_grey,
            onTap: (int tappedIndex){
              setState(() {
                _showPage = _pageChooser(tappedIndex);
                _pageIndex = tappedIndex;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
              label: "Home"),
              BottomNavigationBarItem(
                  icon: _pageIndex==3?SizedBox(
                      height: 25,
                      width: 25,
                      child: new Image.asset('assets/images/panel_about_us.png')):
                  SizedBox(
                      height: 25,
                      width: 25,
                      child: new Image.asset('assets/images/panel_about_us.png')),
                  label: "About Us"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_active_outlined),
                  label: "SOS"),
              BottomNavigationBarItem(
                  icon: _pageIndex==3?SizedBox(
                      height: 25,
                      width: 25,
                      child: new Image.asset('assets/images/panel_support.png')):
                  SizedBox(
                      height: 25,
                      width: 25,
                      child: new Image.asset('assets/images/panel_support.png')),
                  label: "Support"),
            ],
          ),
        ));
  }
}


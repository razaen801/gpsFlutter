import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'appBar/panel_primary_title.dart';

class PanelAboutUs extends StatefulWidget {
  @override
  _PanelAboutUsState createState() => _PanelAboutUsState();
}

class _PanelAboutUsState extends State<PanelAboutUs> {
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
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/panel_back.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            AppbarPrimary(isSecondary: true,),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4))
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("A company, abbreviated as co., is a legal entity representing an association of people,"
                      " whether natural, legal or a mixture of both, with a specific objective. "
                      "Company members share a common purpose and unite to achieve specific, declared goals. "
                      "Companies take various forms. ",style: TextStyle(
                    fontSize: 18
                  ),),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}

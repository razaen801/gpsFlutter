import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/customColors.dart';
import 'package:my_gps_app/models/list_dash_adapter.dart';
import 'package:provider/provider.dart';

class DashListItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 100;
    double height = MediaQuery.of(context).size.height / 100;
    final ListModel listModel = Provider.of<ListModel>(context, listen: false);
    List<String> iconLocation = [];
    iconLocation.add("assets/images/list_network.png");
    iconLocation.add("assets/images/list_network.png");
    iconLocation.add("assets/images/list_key.png");
    iconLocation.add("assets/images/list_call.png");
    iconLocation.add("assets/images/list_red_car.png");
    iconLocation.add("assets/images/list_whatsapp.png");
    iconLocation.add("assets/images/list_share.png");
    iconLocation.add("assets/images/list_share.png");

    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: double.infinity,
              height: height * 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width * 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listModel.title,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: CustomColors.app_red),
                        ),
                        Center(
                          child: Row(
                            children: [
                              Text(
                                "Status:  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              Text(
                                listModel.status,
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: width * 4,
                    child: FittedBox(
                      child: Image.asset('assets/images/list_refresh.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: width * 45,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Speed:  ",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text(
                              "${listModel.speed} KM/HR",
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Driven Today:  ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            Expanded(
                              child: Text(
                                listModel.drivenToday,
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: width * 1,
                    height: height * 3,
                    child: FittedBox(
                      child: Icon(Icons.more_vert_rounded),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            height: height * 8,
            child: Row(
              children: [
                Container(
                  width: width * 15,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.asset(listModel.iconLocation),
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                  child: Text(
                    listModel.location,
                    style:
                        TextStyle(fontSize: 12, color: CustomColors.app_grey),
                  ),
                ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            height: height * 6,
            width: width * 8,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.green),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: height * 6,
                    width: width * 7,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image.asset(iconLocation[0]),
                    ),
                  ),
                  Container(
                    height: height * 6,
                    width: width * 7,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image.asset(iconLocation[1]),
                    ),
                  ),
                  Container(
                    height: height * 6,
                    width: width * 7,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image.asset(iconLocation[2]),
                    ),
                  ),
                  Container(
                    height: height * 6,
                    width: width * 7,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image.asset(iconLocation[3]),
                    ),
                  ),
                  Container(
                    height: height * 6,
                    width: width * 7,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image.asset(iconLocation[4]),
                    ),
                  ),
                  Container(
                    height: height * 6,
                    width: width * 7,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image.asset(iconLocation[5]),
                    ),
                  ),
                  Container(
                    height: height * 6,
                    width: width * 7,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image.asset(iconLocation[6]),
                    ),
                  ),
                  Container(
                    height: height * 6,
                    width: width * 7,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image.asset(iconLocation[7]),
                    ),
                  ),

                ],
              )

              // ListView.builder(
              //   scrollDirection: Axis.horizontal,
              //     itemCount: 8,
              //     itemBuilder: (ctx,position){
              //     return
              //     Container(
              //       width: width*7,
              //       child: FittedBox(
              //         fit: BoxFit.contain,
              //         child: Image.asset( iconLocation[position]),
              //       ),
              //     );
              //     },
              //     ),
              )

          // Row(
          //   children: [
          //     Spacer(),
          //   ],
          // )
        ],
      ),
    );
  }
}

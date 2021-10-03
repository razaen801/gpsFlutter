import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_gps_app/constants.dart';
import 'package:my_gps_app/dashboard/bloc/attendace_bloc.dart';
import 'package:my_gps_app/dashboard/expense/expense_list.dart';
import 'package:my_gps_app/models/menu_item.dart';

import '../customColors.dart';
import 'loading_dialog.dart';

class DialogLeading extends StatelessWidget {
  final Function onPressed;

  const DialogLeading({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MenuItem> menuItems = [];
    menuItems.add(new MenuItem(
        title: "Check In",
        iconLocation: 'assets/images/check_in.png',
        color: CustomColors.app_light_green,
        icon: Icon(
          Icons.email_rounded,
          color: Colors.white,
        ),
        isIcon: true));
    menuItems.add(new MenuItem(
        title: "Check Out",
        iconLocation: 'assets/images/check_out.png',
        color: CustomColors.app_light_red,
        icon: Icon(
          Icons.email_rounded,
          color: Colors.white,
        ),
        isIcon: true));
    menuItems.add(new MenuItem(
        title: "Stop/ Resume Vehicle",
        iconLocation: 'assets/images/report_detail.png',
        color: CustomColors.app_moderate_green,
        icon: Icon(
          Icons.stop,
          color: Colors.white,
        ),
        isIcon: true));
    menuItems.add(new MenuItem(
        title: "Message",
        iconLocation: 'assets/images/more_message.png',
        color: CustomColors.app_light_green,
        icon: Icon(
          Icons.email_rounded,
          color: Colors.white,
        ),
        isIcon: true));

    menuItems.add(new MenuItem(
        title: "Privacy Policy",
        iconLocation: 'assets/images/more_privacy.png',
        color: CustomColors.app_green,
        icon: Icon(Icons.remove_red_eye),
        isIcon: true));
    menuItems.add(new MenuItem(
        title: "Expenses",
        iconLocation: 'assets/images/more_history.png',
        color: CustomColors.app_light_red,
        icon: Icon(Icons.speed),
        isIcon: false));
    menuItems.add(new MenuItem(
        title: "Replay",
        iconLocation: 'assets/images/more_replay.png',
        color: CustomColors.app_green,
        icon: Icon(Icons.speed),
        isIcon: false));
    menuItems.add(new MenuItem(
        title: "Feedback",
        iconLocation: 'assets/images/more_feedback.png',
        color: CustomColors.app_light_pink,
        icon: Icon(Icons.speed),
        isIcon: false));
    menuItems.add(new MenuItem(
        title: "Share Track link",
        iconLocation: 'assets/images/more_share_track.png',
        color: CustomColors.app_dark_green,
        icon: Icon(Icons.speed),
        isIcon: false));

    double width = MediaQuery.of(context).size.width / 100;

    double height = MediaQuery.of(context).size.height / 100;

    // void showToastMessage(String s) {
    //   Fluttertoast.showToast(msg: s,
    //   toastLength: Toast.LENGTH_SHORT);
    // }

    return BlocProvider(
      create: (context) => AttendaceBloc(context),
      child: Material(
        color: Colors.transparent,
        child: BlocListener<AttendaceBloc, AttendaceState>(
          listener: (context, state) {
            if (state is Loading) {
              LoadingDialog.show(context, key: new ObjectKey("loading"));
            } else if (state is NetworkError) {
              Constant.showToastMessage(state.errorMessage);
              LoadingDialog.hide(context);
              Navigator.pop(context);
            } else if (state is CheckInOutSuccess) {
              Constant.showToastMessage("${state.type.capitalize()} Successful");
              LoadingDialog.hide(context);
              Navigator.pop(context);
            } else {
              LoadingDialog.hide(context);
            }
            // TODO: implement listener}
          },
          child: Container(
            child: Container(
              child: ListView.builder(
                physics: ScrollPhysics(),
                itemCount: 9,
                itemBuilder: (context, position) {
                  return BlocBuilder<AttendaceBloc, AttendaceState>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.pop(context);
                          // onPressed(menuItems[position]);
                          if(position==0) {
                            context.read<AttendaceBloc>().add(
                                CheckInOutUser(type: "checkin"));
                          }
                          else  if(position==1) {
                            context.read<AttendaceBloc>().add(
                                CheckInOutUser(type: "checkout"));
                          }
                          else  if(position==5) {
                            Navigator.pop(context);
                           Navigator.push(context, new MaterialPageRoute(
                                builder: (context) => AllExpenseList()));
                          }

                        },
                        child: Container(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                            width: double.infinity,
                            decoration: Constant.getDialogContainerStyle(10),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    height: height * 6,
                                    width: width * 8,
                                    decoration: BoxDecoration(
                                        color: menuItems[position].color,
                                        shape: BoxShape.circle),
                                    child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Image.asset(
                                            menuItems[position].iconLocation)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    menuItems[position].title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

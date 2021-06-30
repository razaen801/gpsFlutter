import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../customColors.dart';
import 'dialog_utils.dart';

class DialogChangePassword extends StatelessWidget {
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
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: width*50,
          height: height*60,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: height*6,

                  child: TextField(
                    // controller: passwordController,
                    // obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      // suffixIcon: IconButton(
                      //   icon: Icon(
                      //     // Based on passwordVisible state choose the icon
                      //     _passwordVisible
                      //         ? Icons.visibility
                      //         : Icons.visibility_off,
                      //     color: Theme.of(context).primaryColorDark,
                      //   ),
                      //   onPressed: () {
                      //     // Update the state i.e. toogle the state of passwordVisible variable
                      //     setState(() {
                      //       _passwordVisible = !_passwordVisible;
                      //     });
                      //   },
                      // ),
                      contentPadding: EdgeInsets.only(left: 30.0),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24.0),
                          borderSide: BorderSide(color: CustomColors.kButtonColor)
                      ),
                      border: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white),
                          // borderSide: new BorderSide(color: Colors.white)),
                          borderRadius: BorderRadius.circular(24.0)
                      ),
                      // icon: const Icon(Icons.lock),
                      labelText: 'Old Password',
                      labelStyle: TextStyle(
                          color: CustomColors.kPrimaryTextColor
                      ),
                      helperText: 'Enter your old password',
                      helperStyle: TextStyle(
                          color: CustomColors.kPrimaryTextColor
                      ),
                      // errorText: _validate ? 'Password Can\'t Be Empty' : null,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: height*6,

                  child: TextField(
                    // controller: passwordController,
                    // obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      // suffixIcon: IconButton(
                      //   icon: Icon(
                      //     // Based on passwordVisible state choose the icon
                      //     _passwordVisible
                      //         ? Icons.visibility
                      //         : Icons.visibility_off,
                      //     color: Theme.of(context).primaryColorDark,
                      //   ),
                      //   onPressed: () {
                      //     // Update the state i.e. toogle the state of passwordVisible variable
                      //     setState(() {
                      //       _passwordVisible = !_passwordVisible;
                      //     });
                      //   },
                      // ),
                      contentPadding: EdgeInsets.only(left: 30.0),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24.0),
                          borderSide: BorderSide(color: CustomColors.kButtonColor)
                      ),
                      border: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white),
                          // borderSide: new BorderSide(color: Colors.white)),
                          borderRadius: BorderRadius.circular(24.0)
                      ),
                      // icon: const Icon(Icons.lock),
                      labelText: 'New Password',
                      labelStyle: TextStyle(
                          color: CustomColors.kPrimaryTextColor
                      ),
                      helperText: 'Enter your new password',
                      helperStyle: TextStyle(
                          color: CustomColors.kPrimaryTextColor
                      ),
                      // errorText: _validate ? 'Password Can\'t Be Empty' : null,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: height*6,
                  child: TextField(
                    // controller: passwordController,
                    // obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      // suffixIcon: IconButton(
                      //   icon: Icon(
                      //     // Based on passwordVisible state choose the icon
                      //     _passwordVisible
                      //         ? Icons.visibility
                      //         : Icons.visibility_off,
                      //     color: Theme.of(context).primaryColorDark,
                      //   ),
                      //   onPressed: () {
                      //     // Update the state i.e. toogle the state of passwordVisible variable
                      //     setState(() {
                      //       _passwordVisible = !_passwordVisible;
                      //     });
                      //   },
                      // ),
                      contentPadding: EdgeInsets.only(left: 30.0),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24.0),
                          borderSide: BorderSide(color: CustomColors.kButtonColor)
                      ),
                      border: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white),
                          // borderSide: new BorderSide(color: Colors.white)),
                          borderRadius: BorderRadius.circular(24.0)
                      ),
                      // icon: const Icon(Icons.lock),
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(
                          color: CustomColors.kPrimaryTextColor
                      ),
                      helperText: 'Enter your confirm password',
                      helperStyle: TextStyle(
                          color: CustomColors.kPrimaryTextColor
                      ),
                      // errorText: _validate ? 'Password Can\'t Be Empty' : null,
                    ),
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  DialogUtils.showCustomDialog(context, title: "Confirm change",
                      content: "Are you sure you want to change your password?",
                      okBtnFunction: () => {
                        Navigator.pop(context)
                      });
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: width * 20,
                  height: height * 3,
                  decoration: Constant.buttonDecoration,
                  child: Center(child: Text("Update",
                    style: TextStyle(color: Colors.white, fontSize: 13),)),
                ),
              )


            ],
          ),

        ),
      ),
    );
  }
}

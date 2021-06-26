
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_gps_app/customColors.dart';
import 'package:my_gps_app/dashboard/botom_navigation.dart';

class LoginPageNew extends StatefulWidget {
  const LoginPageNew({required Key key}) : super(key: key);


  @override
  _LoginPageNewState createState() => _LoginPageNewState();
}

class _LoginPageNewState extends State<LoginPageNew> {

  late TextEditingController nameController;
  late TextEditingController passwordController;
  bool _validate = false;
  bool _validateUser = false;
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
    nameController = TextEditingController();
    passwordController = TextEditingController();
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          body: Container(
            height: MediaQuery.of(context).size.height,
            // height: double.infinity,
            width: double.infinity,

            decoration: BoxDecoration(
              // color: const Color(0xff3676a7),
              image: DecorationImage(
                image: AssetImage("assets/images/splash_main.png"),
                fit: BoxFit.fill,
              ),
            ),
            child:
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: height*15,
                  width: width*50,
                  child: FittedBox
                    (
                    fit: BoxFit.fill,
                      child: Image.asset('assets/images/main_logo.png')),
                ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text(
                  'Welcome to Infinity Member',
                  style: TextStyle(
                    fontFamily: 'Helvetica',
                    fontSize: 22,
                    color: CustomColors.kPrimaryTextColor,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 30.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24.0),
                        ),
                        // icon: const Icon(Icons.email),
                        labelText: 'Email/Username/Phone number',
                        labelStyle: TextStyle(
                          color: CustomColors.kPrimaryTextColor
                        ),
                        helperText: 'A complete, valid email/username/phone',
                        helperStyle: TextStyle(
                          color: CustomColors.kPrimaryTextColor
                        ),
                        errorText: _validateUser ? 'Username Can\'t Be Empty' : null,

                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40,10,40,0),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 30.0),
                        border: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.white),
                            // borderSide: new BorderSide(color: Colors.white)),
                            borderRadius: BorderRadius.circular(24.0)
                        ),
                        // icon: const Icon(Icons.lock),
                        labelText: 'Password',
                          labelStyle: TextStyle(
                              color: CustomColors.kPrimaryTextColor
                          ),
                        helperText: 'Enter your password',
                          helperStyle: TextStyle(
                              color: CustomColors.kPrimaryTextColor
                          ),
                        errorText: _validate ? 'Password Can\'t Be Empty' : null,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            nameController.text.isEmpty ? _validateUser=true:_validateUser =false;
                            passwordController.text.isEmpty ? _validate=true:_validate =false;
                          });

                          if(!_validate && !_validateUser && nameController.text=="admin" && passwordController.text == "12345"){
                            Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=> MyHomePage(key: ObjectKey("dashBoard"))));
                          }
                          else{
                            showDialog(context: context, builder: (context){
                              return AlertDialog(
                                content: Text("Invalid Username or Password"),
                              );
                            });
                            // showToastMessage("Incorrect Username or Password");
                          }


                        },
                        child: Container(
                          width: width*30,
                          height: height*4,
                          decoration: BoxDecoration(
                            shape:BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: CustomColors.kButtonColor,
                          ),
                          child: Center(child: Text("Login",style: TextStyle(color: CustomColors.kPrimaryTextColor,fontSize: 20),)),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){ },
                        child: Container(
                          width: width*30,
                          height: height*4,
                          decoration: BoxDecoration(
                            shape:BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: CustomColors.kButtonColor,
                          ),
                          child: Center(child: Text("Sign Up",style: TextStyle(color: CustomColors.kPrimaryTextColor,fontSize: 20),)),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(25,25,25,25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Forgot Password",style: TextStyle(color: CustomColors.kPrimaryTextColor,fontSize: 18),),
                      Text("External Tracking",style: TextStyle(color: CustomColors.kPrimaryTextColor,fontSize: 18),),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(23,0,23,0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 1,
                        width: width*35,
                        decoration: BoxDecoration(
                            color: CustomColors.kPrimaryTextColor
                        ),
                      ),
                      Text("OR",style: TextStyle(color: CustomColors.kPrimaryTextColor,fontSize: 16),),
                      Container(
                        height: 1,
                        width: width*35,
                        decoration: BoxDecoration(
                            color: CustomColors.kPrimaryTextColor
                        ),
                      ),
                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: GestureDetector(
                    onTap: (){
                      // Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=> MyHomePage(key: ObjectKey("dashBoard"))));
                    },
                    child: Container(
                      width: width*25,
                      height: height*5,
                      decoration: BoxDecoration(
                        shape:BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: CustomColors.kButtonColor,
                      ),
                      child: Center(child: Text("Demo",style: TextStyle(color: CustomColors.kPrimaryTextColor,fontSize: 20),)),
                    ),
                  ),
                ),

                Expanded(child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: height*6,
                    child: Column(
                      children: [
                        Container(
                          height: height*0.2,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: CustomColors.kPrimaryTextColor
                          ),
                        ),
                        Container(
                          height: height*5.8,
                          decoration: BoxDecoration(
                            color: CustomColors.kBoxBackgroundColor
                          ),
                          child: Center(
                            child: Text(
                              "Powered By @                       ",
                              style: TextStyle
                                (
                                color: CustomColors.kButtonColor,
                                fontSize: 18
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ))





              ],
            )
            ,
          ),
        ),
      ),
    );
  }
  void showToastMessage(String s) {
    Fluttertoast.showToast(
        msg: s,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.blue,
        backgroundColor: Colors.white);
  }
}

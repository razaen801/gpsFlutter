import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_gps_app/customColors.dart';
import 'package:my_gps_app/dashboard/botom_navigation.dart';
import 'package:my_gps_app/login/bloc/login_bloc.dart';
import 'package:formz/formz.dart';
import 'package:my_gps_app/server_handler/login/login_repository.dart';
import 'package:my_gps_app/widgets/LoadingIndicator.dart';
import 'package:my_gps_app/widgets/loading_dialog.dart';

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider(
        create: (_) => LoginBloc(repository: LoginRepository()),
        child: LoginPageNew(
          key: new ObjectKey("login"),
        ),
      ),
    );
  }
}

class LoginPageNew extends StatefulWidget {
  const LoginPageNew({required Key key}) : super(key: key);

  @override
  _LoginPageNewState createState() => _LoginPageNewState();
}

class _LoginPageNewState extends State<LoginPageNew> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _validate = false;
  bool _validateUser = false;
  bool _passwordVisible = false;

  @override
  void dispose() {
    // TODO: implement dispose
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = false;
    nameController.text="info@superadmin.com";
    passwordController.text="admin@12";

    // _emailFocusNode.addListener(() {
    //   if (!_emailFocusNode.hasFocus) {
    //     context.read<LoginBloc>().add(EmailUnfocused());
    //     FocusScope.of(context).requestFocus(_passwordFocusNode);
    //   }
    // });

    // _passwordFocusNode.addListener(() {
    //   if (!_passwordFocusNode.hasFocus) {
    //     context.read<LoginBloc>().add(PasswordUnfocused());
    //   }
    // });
  }

  void proceedToDashBoard() {
    Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (context) => MyHomePage(key: ObjectKey("dashBoard")))
    );
  }

  showProgress(){
    return CircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 100;
    double height = MediaQuery.of(context).size.height / 100;
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          LoadingDialog.hide(context);
          proceedToDashBoard();
        } else if (state is LoginLoading) {
          // LoadingIndicator();
          LoadingDialog.show(context, key: new ObjectKey("loading"));
        }
        else if(state is LoginError){
          LoadingDialog.hide(context);
          showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Sorry"),
                      actions: [
                        FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("Ok"))
                      ],
                      content: Text(
                          state.errorMessage),
                    );
                  });
        }
        else{
          LoadingDialog.hide(context);
        }
      },
      child: SafeArea(
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
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    height: height * 15,
                    width: width * 50,
                    child: FittedBox(
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
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            // initialValue: state.email.value,
                            controller: nameController,
                            // focusNode: _emailFocusNode,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 30.0),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide(
                                      color: CustomColors.kButtonColor)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24.0),
                                // borderSide: BorderSide(color: CustomColors.kButtonColor)
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              // icon: const Icon(Icons.email),
                              labelText: 'Email/Username/Phone number',
                              labelStyle: TextStyle(
                                  color: CustomColors.kPrimaryTextColor),
                              helperText:
                                  'A complete, valid email/username/phone',
                              helperStyle: TextStyle(
                                  color: CustomColors.kPrimaryTextColor),
                              errorText: _validateUser
                                  ? 'Username Can\'t Be Empty'
                                  : null,
                            ),
                            onChanged: (value) {
                              setState(() {
                                _validateUser= false;
                              });
                            //   context
                            //       .read<LoginBloc>()
                            //       .add(EmailChanged(email: value));
                            },
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            // initialValue: state.password.value,
                            // focusNode: _passwordFocusNode,
                            controller: passwordController,

                            // obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 30.0),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide(
                                      color: CustomColors.kButtonColor)),
                              border: OutlineInputBorder(
                                  borderSide:
                                      new BorderSide(color: Colors.white),
                                  // borderSide: new BorderSide(color: Colors.white)),
                                  borderRadius: BorderRadius.circular(24.0)),
                              // icon: const Icon(Icons.lock),
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  color: CustomColors.kPrimaryTextColor),
                              helperText: 'Enter your password',
                              helperStyle: TextStyle(
                                  color: CustomColors.kPrimaryTextColor),
                              errorText: _validate
                                  ? 'Password Can\'t Be Empty'
                                  : null,
                            ),
                            onChanged: (value) {
                              setState(() {
                                _validate=false;
                              });
                            //   context
                            //       .read<LoginBloc>()
                            //       .add(PasswordChanged(password: value));
                            },
                            textInputAction: TextInputAction.done,
                            obscureText: true,
                          ),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return
                        Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap:(){
                                setState(() {
                                  nameController.text.isEmpty
                                      ? _validateUser = true
                                      : _validateUser = false;
                                  passwordController.text.isEmpty
                                      ? _validate = true
                                      : _validate = false;
                                });
                                if(!_validate && !_validateUser)
                                context.read<LoginBloc>().add(FormSubmitted(email: nameController.text,password: passwordController.text));
                              },
                                  // () =>
                                  // context.read<LoginBloc>().add(FormSubmitted(email: nameController.text,password: passwordController.text)),

                              //
                              //   if (!_validate &&
                              //       !_validateUser &&
                              //       nameController.text == "admin" &&
                              //       passwordController.text == "12345") {
                              //     Navigator.pushReplacement(
                              //         context,
                              //         new MaterialPageRoute(
                              //             builder: (context) => MyHomePage(
                              //                 key: ObjectKey("dashBoard"))));
                              //   } else {
                              //     showDialog(
                              //         context: context,
                              //         builder: (context) {
                              //           return AlertDialog(
                              //             content: Text(
                              //                 "Invalid Username or Password"),
                              //           );
                              //         });
                              //     // showToastMessage("Incorrect Username or Password");
                              //   }
                              // },
                              child: Container(
                                width: width * 30,
                                height: height * 4,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: CustomColors.kButtonColor,
                                ),
                                child: Center(
                                    child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: CustomColors.kPrimaryTextColor,
                                      fontSize: 20),
                                )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: width * 30,
                                height: height * 4,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: CustomColors.kButtonColor,
                                ),
                                child: Center(
                                    child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: CustomColors.kPrimaryTextColor,
                                      fontSize: 20),
                                )),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Forgot Password",
                          style: TextStyle(
                              color: CustomColors.kPrimaryTextColor,
                              fontSize: 18),
                        ),
                        Text(
                          "External Tracking",
                          style: TextStyle(
                              color: CustomColors.kPrimaryTextColor,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(23, 0, 23, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 1,
                          width: width * 35,
                          decoration: BoxDecoration(
                              color: CustomColors.kPrimaryTextColor),
                        ),
                        Text(
                          "OR",
                          style: TextStyle(
                              color: CustomColors.kPrimaryTextColor,
                              fontSize: 16),
                        ),
                        Container(
                          height: 1,
                          width: width * 35,
                          decoration: BoxDecoration(
                              color: CustomColors.kPrimaryTextColor),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=> MyHomePage(key: ObjectKey("dashBoard"))));
                      },
                      child: Container(
                        width: width * 25,
                        height: height * 5,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: CustomColors.kButtonColor,
                        ),
                        child: Center(
                            child: Text(
                          "Demo",
                          style: TextStyle(
                              color: CustomColors.kPrimaryTextColor,
                              fontSize: 20),
                        )),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: height * 6,
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.2,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: CustomColors.kPrimaryTextColor),
                          ),
                          Container(
                            height: height * 5.8,
                            decoration: BoxDecoration(
                                color: CustomColors.kBoxBackgroundColor),
                            child: Center(
                              child: Text(
                                "Powered By @                       ",
                                style: TextStyle(
                                    color: CustomColors.kButtonColor,
                                    fontSize: 18),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
                ],
              ),
            ),
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

class ShowProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: CircularProgressIndicator(
        strokeWidth: 4,
      )),
    );
  }
}

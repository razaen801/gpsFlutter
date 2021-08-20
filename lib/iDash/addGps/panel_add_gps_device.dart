import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gps_app/customColors.dart';
import 'package:my_gps_app/login/bloc/login_bloc.dart';
import 'package:my_gps_app/server_handler/login/login_repository.dart';
import 'package:my_gps_app/widgets/loading_dialog.dart';
import 'package:provider/provider.dart';

class PanelAddGps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(repository: LoginRepository()),
      child: PanelAddGpsDevice(),
    );
  }
}

class PanelAddGpsDevice extends StatefulWidget {
  @override
  _PanelAddGpsDeviceState createState() => _PanelAddGpsDeviceState();
}

class _PanelAddGpsDeviceState extends State<PanelAddGpsDevice> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  TextEditingController imeiController = new TextEditingController();
  TextEditingController simController = new TextEditingController();
  TextEditingController deviceModelController = new TextEditingController();
  TextEditingController serialController = new TextEditingController();

  void clearFields() {
    usernameController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    imeiController.clear();
    simController.clear();
    deviceModelController.clear();
    serialController.clear();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 100;
    double height = MediaQuery.of(context).size.height / 100;
    var mediaQuery = MediaQuery.of(context);

    // context.read<LoginBloc>().add(EmailUnfocused());

    void showDialogWithMessage(String title, String message) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(title),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok"))
              ],
              content: Text(message),
            );
          });
    }

    return Material(
      // child: BlocListener<LoginBloc, LoginState>(
      //   listener: (context, state) {
      //     if (state is LoginLoading) {
      //       LoadingDialog.show(context, key: new ObjectKey("loading"));
      //     } else if (state is LoginError) {
      //       LoadingDialog.hide(context);
      //       showDialogWithMessage("Sorry", state.errorMessage);
      //     } else if (state is ApiCallSuccess) {
      //       LoadingDialog.hide(context);
      //       showDialogWithMessage("Success",
      //           "GPS Device registered successfully. Now you can login to fill KYC Form");
      //       clearFields();
      //     } else {
      //       LoadingDialog.hide(context);
      //     }
      //   },
        child: SafeArea(
          child: Container(
            child: ListView(
              physics: ScrollPhysics(),
              padding: mediaQuery.viewInsets,
              children: [
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Center(
                    child: Container(
                      width: width * 50,
                      height: height * 15,
                      child: FittedBox(
                          fit: BoxFit.contain,
                          child: Image.asset('assets/images/main_logo.png')),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Text(
                    "Register GPS Device",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextView(
                  customController: deviceModelController,
                  title: "Device Model",
                  isPasswordType: false,
                ),
                CustomTextView(
                  customController: serialController,
                  title: "Serial Number",
                  isPasswordType: false,
                ),
                CustomTextView(
                  customController: imeiController,
                  title: "IME Number",
                  isPasswordType: false,
                ),
                CustomTextView(
                  customController: simController,
                  title: "SIM Number",
                  isPasswordType: false,
                ),
                CustomTextView(
                  customController: usernameController,
                  title: "Email",
                  isPasswordType: false,
                ),
                CustomTextView(
                  customController: passwordController,
                  title: "Password",
                  isPasswordType: true,
                ),
                CustomTextView(
                  customController: confirmPasswordController,
                  title: "Confirm Password",
                  isPasswordType: true,
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: width * 30,
                    height: height * 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: CustomColors.kButtonColor,
                    ),
                    child: Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: CustomColors.kPrimaryTextColor,
                              fontSize: 20),
                        )),
                  ),
                ),
                // BlocBuilder(builder: (context, state) {
                //   return GestureDetector(
                //     onTap: () {
                //       // BlocProvider.of<LoginBloc>(context).add(RegisterFormSubmitted(
                //       //     email: usernameController.text,
                //       //     password: passwordController.text,
                //       //     serial_number: serialController.text,
                //       //     ime_number: imeiController.text,
                //       //     sim_number: simController.text,
                //       //     device_model: deviceModelController.text));
                //     },
                //     child:
                //     Container(
                //       width: width * 30,
                //       height: height * 4,
                //       decoration: BoxDecoration(
                //         shape: BoxShape.rectangle,
                //         borderRadius: BorderRadius.all(Radius.circular(15)),
                //         color: CustomColors.kButtonColor,
                //       ),
                //       child: Center(
                //           child: Text(
                //         "Register",
                //         style: TextStyle(
                //             color: CustomColors.kPrimaryTextColor,
                //             fontSize: 20),
                //       )),
                //     ),
                //   );
                // }),
              ],
            ),
          ),
        ),
      // ),
    );
  }
}

class CustomTextView extends StatelessWidget {
  final TextEditingController customController;
  final String title;
  final bool isPasswordType;

  CustomTextView(
      {required this.customController,
      required this.title,
      required this.isPasswordType});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        children: [
          // Text(title),
          TextFormField(
            keyboardType: TextInputType.text,
            obscureText: isPasswordType,
            controller: customController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 30),
              labelText: title,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  color: Colors.blue,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  color: CustomColors.kButtonColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

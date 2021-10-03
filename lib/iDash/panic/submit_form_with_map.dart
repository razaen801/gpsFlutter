import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_gps_app/constants.dart';
import 'package:my_gps_app/customColors.dart';
import 'package:my_gps_app/dashboard/bloc/attendace_bloc.dart';
import 'package:my_gps_app/iDash/appBar/panel_primary_title.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_gps_app/models/menu_item.dart';
import 'package:my_gps_app/widgets/dialog_utils.dart';
import 'package:my_gps_app/widgets/loading_dialog.dart';
import 'package:my_gps_app/constants.dart';

class PanicWithMap extends StatelessWidget {

  MenuItem type;

  PanicWithMap({required this.type});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AttendaceBloc(context),
      child: PanicMapForm(type: type,),
    );
  }
}


class PanicMapForm extends StatefulWidget {
  MenuItem type;
  late File selectedImage;

  PanicMapForm({required this.type});

  @override
  _PanicFormState createState() => _PanicFormState();
}

class _PanicFormState extends State<PanicMapForm> {

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(27.693038, 85.281412), //longlatlla
    zoom: 14.4746,
  );
  Completer<GoogleMapController> _controller = Completer();


  var selectedImageText = "No Files Selected";
  final ImagePicker _imagePicker = ImagePicker();
  TextEditingController nameController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController moreDetailsController = new TextEditingController();
  void clearFields(){
    nameController.clear();
    addressController.clear();
    phoneController.clear();
    emailController.clear();
    moreDetailsController.clear();
  }

  @override
  Widget build(BuildContext context) {
    context.read<AttendaceBloc>().add(PanicInit());
    double width = MediaQuery
        .of(context)
        .size
        .width / 100;
    double height = MediaQuery
        .of(context)
        .size
        .height / 100;


    void _selectImageDialog(int imageType) async {
      PickedFile? pickedImage = await _imagePicker.getImage(
          source: imageType == 1 ? ImageSource.gallery : ImageSource.camera,
          imageQuality: 50);
      File image = File(pickedImage!.path);

      // File image = await ImagePicker.pickImage(
      //     source: ImageSource.camera, imageQuality: 50
      // );

      setState(() {
        widget.selectedImage = image;
        selectedImageText = image.path
            .toString()
            .split("/")
            .last;
      });
    }

    void _showPicker(context, int imageType) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext bc) {
            return SafeArea(
              child: Container(
                child: new Wrap(
                  children: <Widget>[
                    new ListTile(
                        leading: new Icon(Icons.photo_library),
                        title: new Text('Photo Library'),
                        onTap: () {
                          _selectImageDialog(1);
                          Navigator.of(context).pop();
                        }),
                    new ListTile(
                      leading: new Icon(Icons.photo_camera),
                      title: new Text('Camera'),
                      onTap: () {
                        _selectImageDialog(2);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            );
          });
    }

    bool validate() {
      bool isValid = true;
      if (nameController.text.isEmpty) {
        isValid = false;
        Constant.showToastMessage("Please enter your name");
      } else if (emailController.text.isEmpty) {
        isValid = false;
        Constant.showToastMessage("Please enter your email address");
      } else if (phoneController.text.isEmpty) {
        isValid = false;
        Constant.showToastMessage("Please enter your phone number");
      }else if(phoneController.text.length!=10){
        isValid = false;
        Constant.showToastMessage("Please enter valid phone number");
      }
      else if (moreDetailsController.text.isEmpty) {
        isValid = false;
        Constant.showToastMessage(
            "Please enter the details of ${widget.type.title}");
      }
      return isValid;
    }

    return BlocListener<AttendaceBloc, AttendaceState>(
      listener: (context, state) {
        if (state is Loading) {
          LoadingDialog.show(context, key: new ObjectKey('loading'));
        } else if (state is NetworkError) {
          LoadingDialog.hide(context);
          DialogUtils.showInfoDialog(context,
              title: "Error",
              content: state.errorMessage,
              okBtnFunction: () {});
        } else if (state is PanicFormSuccess) {
          LoadingDialog.hide(context);
          DialogUtils.showInfoDialog(context,
              title: "Success",
              content: "${widget.type.title.capitalize()} Form Submitted Successfully.",
              okBtnFunction: () {
              });
          clearFields();
        } else {
          LoadingDialog.hide(context);
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            // shrinkWrap: true,
            // physics: ScrollPhysics(),
            // alignment: AlignmentDirectional.bottomCenter,
            overflow: Overflow.visible,
            children: [
              Container(
                height: height * 160,
                child: Column(
                  children: [
                    Container(
                      height: height * 75,
                      width: double.infinity,
                      child: GoogleMap(
                        mapType: MapType.hybrid,
                        initialCameraPosition: _kGooglePlex,
                        myLocationEnabled: true,
                        onMapCreated: (GoogleMapController controller) {
                          _controller.complete(controller);
                        },
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    )
                  ],
                ),
              ),
              Positioned(
                top: height * 74.2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(16.0),
                        bottomLeft: Radius.circular(0.0)),
                  ),
                  height: height * 90,
                  width: width * 100,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
                    child: Column(
                      // physics: ScrollPhysics(),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: Center(
                            child: Text(
                              "${widget.type.title} Information",
                              style: TextStyle(
                                  fontSize: 22,
                                  color: CustomColors.kButtonColor),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            controller: nameController,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 30.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide(
                                      color: CustomColors.kButtonColor)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide(
                                      color: CustomColors.kPrimaryTextColor)),
                              // icon: const Icon(Icons.email),
                              labelText: 'Full name',
                              labelStyle: TextStyle(color: Colors.black54),
                              helperText: 'Enter Full Name',
                              helperStyle: TextStyle(color: Colors.black87),
                              // errorText: _validateUser ? 'Username Can\'t Be Empty' : null,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: false,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              controller: addressController,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 30.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                    borderSide: BorderSide(
                                        color: CustomColors.kButtonColor)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                    borderSide: BorderSide(
                                        color: CustomColors.kPrimaryTextColor)),
                                // icon: const Icon(Icons.email),
                                labelText: 'Address',
                                labelStyle: TextStyle(color: Colors.black54),
                                helperText: 'Enter Address',
                                helperStyle: TextStyle(color: Colors.black87),
                                // errorText: _validateUser ? 'Username Can\'t Be Empty' : null,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 30.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide(
                                      color: CustomColors.kButtonColor)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide(
                                      color: CustomColors.kPrimaryTextColor)),
                              // icon: const Icon(Icons.email),
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.black54),
                              helperText: 'Enter Email Address',
                              helperStyle: TextStyle(color: Colors.black87),
                              // errorText: _validateUser ? 'Username Can\'t Be Empty' : null,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            controller: phoneController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 30.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide(
                                      color: CustomColors.kButtonColor)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide(
                                      color: CustomColors.kPrimaryTextColor)),
                              // icon: const Icon(Icons.email),
                              labelText: 'Contact No',
                              labelStyle: TextStyle(color: Colors.black54),
                              helperText: 'Enter Contact Number',
                              helperStyle: TextStyle(color: Colors.black87),
                              // errorText: _validateUser ? 'Username Can\'t Be Empty' : null,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 40),
                          child: Column(
                            children: [
                              Text(
                                'Upload photo',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: CustomColors.kButtonColor,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 6, horizontal: 4)),
                                      onPressed: () {
                                        _showPicker(context, 1);
                                      },
                                      child: Text("Choose File")),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        '$selectedImageText',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextField(
                            controller: moreDetailsController,
                            textInputAction: TextInputAction.go,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 30.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide(
                                      color: CustomColors.kButtonColor)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                  borderSide: BorderSide(
                                      color: CustomColors.kPrimaryTextColor)),
                              // icon: const Icon(Icons.email),
                              labelText: '${widget.type.title} Details',
                              labelStyle: TextStyle(color: Colors.black54),
                              helperText: 'Enter ${widget.type.title} Details',
                              helperStyle: TextStyle(color: Colors.black87),
                              // errorText: _validateUser ? 'Username Can\'t Be Empty' : null,
                            ),
                          ),
                        ),
                        BlocBuilder<AttendaceBloc, AttendaceState>(
                          builder: (context, state) {
                            return Padding(
                              padding: const EdgeInsets.all(38.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: CustomColors.kButtonColor),
                                  onPressed: () {
                                    if (validate()) {
                                      context.read<AttendaceBloc>().add(
                                          SubmitPanicDetails(
                                              name: nameController.text,
                                              email: emailController.text,
                                              phone: phoneController.text,
                                              type: widget.type.title,
                                              imageFile: ""));
                                    }
                                  },
                                  child: Text("Submit")),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

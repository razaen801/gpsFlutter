

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gps_app/customColors.dart';
import 'package:my_gps_app/iDash/appBar/panel_primary_title.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_gps_app/models/menu_item.dart';

class PanicForm extends StatefulWidget {
  MenuItem type;
  late File selectedImage;

  PanicForm({required this.type});

  @override
  _PanicFormState createState() => _PanicFormState();
}

class _PanicFormState extends State<PanicForm> {
  var selectedImageText = "No Files Selected";
  final ImagePicker _imagePicker = ImagePicker();
  TextEditingController nameController= new TextEditingController();
  TextEditingController addressController= new TextEditingController();
  TextEditingController phoneController= new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController moreDetailsController = new TextEditingController();
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


    void _selectImageDialog(int imageType) async {

      PickedFile? pickedImage = await _imagePicker.getImage(source:imageType==1?ImageSource.gallery:ImageSource.camera,
          imageQuality: 50);
      File image = File(pickedImage!.path);

      // File image = await ImagePicker.pickImage(
      //     source: ImageSource.camera, imageQuality: 50
      // );

      setState(() {
          widget.selectedImage = image;
         selectedImageText = image.path.toString().split("/").last;
      });
    }


    void _showPicker(context,int imageType) {
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
          }
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/panel_back.png'),
              fit: BoxFit.fill,
            ),
          ),
          child:
          ListView(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            children: [
              AppbarPrimary(isSecondary: true,),
              Container(
                margin: EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Column(
                  // physics: ScrollPhysics(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Center(
                        child: Text("${widget.type.title} Information",style: TextStyle(
                          fontSize: 22,
                          color: CustomColors.kButtonColor
                        ),),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 30.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              borderSide: BorderSide(color: CustomColors.kButtonColor)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              borderSide: BorderSide(color: CustomColors.kPrimaryTextColor)
                          ),
                          // icon: const Icon(Icons.email),
                          labelText: 'Full name',
                          labelStyle: TextStyle(
                              color: Colors.black54
                          ),
                          helperText: 'Enter Full Name',
                          helperStyle: TextStyle(
                              color: Colors.black87
                          ),
                          // errorText: _validateUser ? 'Username Can\'t Be Empty' : null,
                        ),

                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: addressController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 30.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              borderSide: BorderSide(color: CustomColors.kButtonColor)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              borderSide: BorderSide(color: CustomColors.kPrimaryTextColor)
                          ),
                          // icon: const Icon(Icons.email),
                          labelText: 'Address',
                          labelStyle: TextStyle(
                              color: Colors.black54
                          ),
                          helperText: 'Enter Address',
                          helperStyle: TextStyle(
                              color: Colors.black87
                          ),
                          // errorText: _validateUser ? 'Username Can\'t Be Empty' : null,
                        ),

                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 30.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              borderSide: BorderSide(color: CustomColors.kButtonColor)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              borderSide: BorderSide(color: CustomColors.kPrimaryTextColor)
                          ),
                          // icon: const Icon(Icons.email),
                          labelText: 'Email',
                          labelStyle: TextStyle(
                              color: Colors.black54
                          ),
                          helperText: 'Enter Email Address',
                          helperStyle: TextStyle(
                              color: Colors.black87
                          ),
                          // errorText: _validateUser ? 'Username Can\'t Be Empty' : null,
                        ),

                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 30.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              borderSide: BorderSide(color: CustomColors.kButtonColor)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24.0),
                            borderSide: BorderSide(color: CustomColors.kPrimaryTextColor)
                          ),
                          // icon: const Icon(Icons.email),
                          labelText: 'Contact No',
                          labelStyle: TextStyle(
                              color: Colors.black54
                          ),
                          helperText: 'Enter Contact Number',
                          helperStyle: TextStyle(
                              color: Colors.black87
                          ),
                          // errorText: _validateUser ? 'Username Can\'t Be Empty' : null,
                        ),

                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20,horizontal: 40),
                      child: Column(
                        children: [
                          Text('Upload photo',style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: CustomColors.kButtonColor,
                                      padding: EdgeInsets.symmetric(vertical: 6,horizontal: 4)
                                  ),
                                  onPressed: (){
                                    _showPicker(context, 1);
                                  },
                                  child: Text("Choose File")),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('$selectedImageText',
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
                        controller: phoneController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 30.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              borderSide: BorderSide(color: CustomColors.kButtonColor)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              borderSide: BorderSide(color: CustomColors.kPrimaryTextColor)
                          ),
                          // icon: const Icon(Icons.email),
                          labelText: '${widget.type.title} Details',
                          labelStyle: TextStyle(
                              color: Colors.black54
                          ),
                          helperText: 'Enter ${widget.type.title} Details',
                          helperStyle: TextStyle(
                              color: Colors.black87
                          ),
                          // errorText: _validateUser ? 'Username Can\'t Be Empty' : null,
                        ),

                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(38.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: CustomColors.kButtonColor
                          ),
                          onPressed: (){

                          },
                          child: Text("Submit")),
                    ),




                  ],
                ),

              )
            ],
          ),
        ),
      ),
    );
  }

}

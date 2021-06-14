
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPageNew extends StatefulWidget {
  const LoginPageNew({required Key key}) : super(key: key);


  @override
  _LoginPageNewState createState() => _LoginPageNewState();
}

class _LoginPageNewState extends State<LoginPageNew> {
  late FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,

          decoration: BoxDecoration(
            color: const Color(0xff3676a7),
          ),
          child:
          Column(
            children: [
              SizedBox
                (
                height: 190,
                  width: 190,
                  child: Image.asset('assets/images/ic_logo.png')),

            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 8),
              child: Text(
                'Welcome to EZ to Track',
                style: TextStyle(
                  fontFamily: 'Helvetica',
                  fontSize: 20,
                  color: const Color(0xffffffff),
                ),
                textAlign: TextAlign.left,
              ),
            ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 30.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0)
                    ),
                    icon: const Icon(Icons.email),
                    labelText: 'Email/Username/Phone number',
                    helperText: 'A complete, valid email/username/phone',
                  ), 

                ),
              ),
            ],
          )
          ,
        ),
      ),
    );
  }
}

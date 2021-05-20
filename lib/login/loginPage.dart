
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gps_app/constants.dart';
import 'package:my_gps_app/login/bloc/login_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
// ffr45ignore: import_of_legacy_library_into_null_safe
import 'package:formz/formz.dart';

import '../customColors.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: BlocProvider(
            create: (_) => LoginBloc(),
            child: MyForm(),
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyLoginForm createState() => _MyLoginForm();
}

class _MyLoginForm extends State<MyForm> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailFocusNode.addListener(() {
      if(!_emailFocusNode.hasFocus){
        context.read<LoginBloc>().add(EmailUnfocused());
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });

    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<LoginBloc>().add(PasswordUnfocused());
      }
    });

  }
  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc,LoginState>(
      listener: (context,state){
        if(state.status.isSubmissionSuccess){
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          showDialog(context: context,
            builder:(_)=> SuccessDialog(),
          );
        }

        if(state.status.isSubmissionInProgress){
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text("Submitting")),
            );
        }
      },
      child: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0,15,0,30),
                  child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            width: 80,
                              height: 80,
                              child: Image.asset("assets/images/main_icon.png")),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: SizedBox(
                                height: 50,
                                child: Text("Welcome to EZ2Track",style: TextStyle(
                                    fontSize: 30,
                                    fontStyle: FontStyle.normal
                                ),
                                )
                            ),
                          ),
                        ],
                      )
                  ),
                ),
                EmailInput(focusNode: _emailFocusNode),
                PasswordInput(focusNode: _passwordFocusNode),
                SubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );

    // TODO: implement build
    throw UnimplementedError();
  }
}

class EmailInput extends StatelessWidget{
  final FocusNode focusNode;
  const EmailInput({Key? key, required this.focusNode}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8,horizontal: 30),
          child: TextFormField(
            initialValue: state.email.value,
            focusNode: focusNode,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 30.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24.0)
              ),
              // icon: const Icon(Icons.email),
              labelText: 'Email/Username/Phone number',
              helperText: 'A complete, valid email/username/phone',
              errorText: state.email.invalid
                  ? 'Please ensure the email entered is valid'
                  : null,
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              context.read<LoginBloc>().add(EmailChanged(email: value));
            },
            textInputAction: TextInputAction.next,
          ),
        );
      },
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key, required this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8,horizontal: 30),
          child: TextFormField(
            initialValue: state.password.value,
            focusNode: focusNode,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 30.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24.0)
              ),
              // icon: const Icon(Icons.lock),
              helperText:
              'Please enter your password',
              helperMaxLines: 2,
              labelText: 'Password',
              errorMaxLines: 2,
              errorText: state.password.invalid
                  ? 'Password must be at least 8 characters and contain at least one letter and number'
                  : null,
            ),
            obscureText: true,
            onChanged: (value) {
              context.read<LoginBloc>().add(PasswordChanged(password: value));
            },
            textInputAction: TextInputAction.done,
          ),
        );
      },
    );
  }
}


class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      onPrimary: Colors.black87,
      primary: Colors.grey[300],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      )
    );
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: ElevatedButton(
            style:Constant.buttonStyle,
            // style: Constant.buttonStyle,
            onPressed: state.status.isValidated
                ? () => context.read<LoginBloc>().add(FormSubmitted())
                : null,
            child: const Text('Submit'),
          ),
        );
      },
    );
  }
}



class SuccessDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const Icon(Icons.info),
                const Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Form Submitted Successfully!',
                      softWrap: true,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}

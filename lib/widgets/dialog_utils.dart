import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static DialogUtils _instance = new DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showCustomDialog(BuildContext context,
      {required String title,
        required String content,
        String okBtnText = "Ok",
        String cancelBtnText = "Cancel",
        required VoidCallback okBtnFunction}) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(title),
            content: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(content),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text(okBtnText),
                onPressed: okBtnFunction,
              ),
              FlatButton(
                  child: Text(cancelBtnText),
                  onPressed: () => Navigator.pop(context))
            ],
          );
        });
  }
}
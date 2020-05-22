import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class SnackBarHelper {
  static void showFailureMessage(BuildContext context,
      {@required String message, String title, int seconds = 3}) {
    Flushbar(
      title: title ?? '',
      message: message ?? '',
      duration: Duration(seconds: seconds),
      margin: EdgeInsets.all(8),
      leftBarIndicatorColor: Colors.red,
      icon: Icon(Icons.warning, color: Colors.red),
    )..show(context);
  }

  static void showSuccessMessage(BuildContext context,
      {@required String message, String title, int seconds = 3}) {
    Flushbar(
      title: title ?? '',
      message: message ?? '',
      duration: Duration(seconds: seconds),
      margin: EdgeInsets.all(8),
      leftBarIndicatorColor: Colors.green,
      icon: Icon(Icons.check, color: Colors.green),
    )..show(context);
  }
}

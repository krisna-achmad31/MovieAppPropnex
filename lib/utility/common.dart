
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Common{

  static void showToast(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0
    );
  }
  static Future<void> showConfirmationDialog(
    BuildContext context,
    String title,
    String message,
    String positiveButtonLabel,
    String negativeButtonLabel,
    Function onPositiveButtonClicked,
    Function onNegativeButtonClicked,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(positiveButtonLabel),
              onPressed: () {
                Navigator.of(context).pop();
                onPositiveButtonClicked();
              },
            ),
            TextButton(
              child: Text(negativeButtonLabel),
              onPressed: () {
                Navigator.of(context).pop();
                onNegativeButtonClicked();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> showSingleButtonDialog(
      BuildContext context,
      String title,
      String message,
      String buttonLabel,
      Function onButtonClicked,
      ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).primaryColor
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  message,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "GothamBook",
                      height: 1.25
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                buttonLabel,
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).accentColor
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                onButtonClicked();
              },
            ),
          ],
        );
      },
    );
  }

}
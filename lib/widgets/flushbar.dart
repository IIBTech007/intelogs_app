
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class flushBar {
  Widget flushbar(String title, String message,int duration,context) {
    return Flushbar(

      duration: Duration(seconds: 4),
      title: "Opps",
      //ignored since titleText != null
      message: "error",
      //ignored since messageText != null
      titleText: Text(title, style: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.yellow[600],
          fontFamily: "ShadowsIntoLightTwo"),),
      messageText: Text(message, style: TextStyle(fontSize: 16.0,
          color: Colors.green,
          fontFamily: "ShadowsIntoLightTwo"),),
    )
      ..show(context);
  }
}
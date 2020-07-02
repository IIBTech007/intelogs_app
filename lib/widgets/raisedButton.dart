import 'package:flutter/material.dart';


class raisedButton {


  Widget intelog_button(String text, Color highlightColor,
      Color fillColor, Color textColor,context, void function()) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.width*0.11,
        width: MediaQuery.of(context).size.width*0.7,
        child: RaisedButton(
          color: fillColor,
          highlightElevation: 0.0,
          //splashColor: splashColor,
          highlightColor: highlightColor,
//      elevation: 0.0,

          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          child: Text(
            text,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: textColor, fontSize: 20),
          ),
          onPressed: () {
            function();
          },
        ),
      ),
    );
  }
}
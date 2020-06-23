import 'dart:convert';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intelogsapp/json_services/api_services.dart';
import '../utils/clipper.dart';

class gridBox {
  Widget gridbox(String title, IconData icon ,void function()) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(borderRadius: BorderRadius.circular(100.0),
            onTap: () {
             function();
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              width: 80,
              height: 80,
              decoration: BoxDecoration(

                color: Colors.amber[600],
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: Icon(
                icon, size: 40, color: Colors.white,),
            ),
          ),
          SizedBox(height: 5,),
          Center(
            child:  Text(title, style: TextStyle(fontWeight: FontWeight.bold,),),
          ),
        ],
      );

  }
}
import 'package:flutter/material.dart';

class detailPageRowWidget {
  Widget rowdetailpage(String title, String content ,context) {
    return Container(
      //padding: EdgeInsets.only(top: 15 ),
      height: 55,
      width: MediaQuery.of(context).size.width,
      //height: MediaQuery.of(context).size.height * 0.075,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey.shade300
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 15
            ),
            ),
          ),
          SizedBox(width: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(content!=null?content:"", style: TextStyle(
              //fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 15
            ),
            ),
          ),
        ],
      ),
    );
  }
  }
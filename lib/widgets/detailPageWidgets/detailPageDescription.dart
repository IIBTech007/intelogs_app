import 'package:flutter/material.dart';

class detailPageDesciption {
  Widget detailPagedesciption(String title, String content ,context) {
    return Wrap(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 15, bottom: 15 ),
          //height: 130,
          width: MediaQuery.of(context).size.width,
          //height: MediaQuery.of(context).size.height * 0.075,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade300
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(title, style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15
                ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 35, top: 7),
                child: Text(content!=null?content:"", style: TextStyle(
                  //fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15
                ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
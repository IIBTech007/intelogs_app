import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Monthly extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MonthlyState();
  }

}

class _MonthlyState extends State<Monthly> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Colors.grey.shade200,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(5),
            ),
            Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(5),
              //padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("New Task",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("5")
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(3) ,
            ),
            Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(5),
              //padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Working Task",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("2")
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(3) ,
            ),
            Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(5),
              //padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Near to Finish",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("1")
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(3) ,
            ),
            Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(5),
              //padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Unattended Task",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("5")
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(3) ,
            ),
            Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(5),
              //padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Unattended Logs",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("2")
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(3) ,
            ),
            Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(5),
              //padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Pending Task",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("1")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
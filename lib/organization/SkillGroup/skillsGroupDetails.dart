import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SkillsGroupDetails extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _skills_group_details ();
  }

}

class _skills_group_details extends State<SkillsGroupDetails>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade400,
        title: Text("Skills Group Details"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 15 ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.start,
//          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 55,
              width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height * 0.075,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.shade300
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                Text("Name:", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20
                ),
                ),
                  Text("assets", style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      color: Colors.black,
                    fontSize: 18
                  ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Code:", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20
                  ),
                  ),
                  Text("#05MA94LA", style: TextStyle(
                    //fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18
                  ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: 55,
              width: MediaQuery.of(context).size.width,
              //height: MediaQuery.of(context).size.height * 0.075,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey.shade300
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text("Skill Group:", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20
                  ),
                  ),
                  Text("Janitor", style: TextStyle(
                    //fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18
                  ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Wrap(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 15, bottom: 15 ),
                  //height: 130,
                  width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height * 0.075,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.shade300
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text("Skill Description:", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20
                        ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15, top: 7),
                        child: Text("My name is muzammal, i study in toilet, i work as janitor in IIB Tech", style: TextStyle(
                          //fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
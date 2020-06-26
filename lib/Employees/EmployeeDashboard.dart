import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intelogsapp/utils/application.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class EmployeeDashboard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EmployeeDashboardState();
  }

}

class _EmployeeDashboardState extends State<EmployeeDashboard>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee Dashboard"),
    backgroundColor: Colors.amber.shade400,
    ),
      body: Container(
        padding: EdgeInsets.all(5),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Scrollbar(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(12),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    //color: Colors.grey.shade200,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                       Padding(
                         padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                         child: Container(
                           child:  CircleAvatar(
                             backgroundImage: AssetImage('assets/image.jpg'),
                             radius: 80,
                           ),
                         ),
                       ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Harry Potter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              Text("harrypotter7@gmail.com", style: TextStyle(fontSize: 15),),
                              Row(
                                children: <Widget>[
                                  Text("as a "),
                                  Text("Shift Incharge", style: TextStyle(fontWeight: FontWeight.bold),)
                                ],
                              )
                            ],

                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                  ),
                  Container(
                    //color:  Colors.grey.shade100,
                    width:MediaQuery.of(context).size.width,
                    height: 65,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          //color: Colors.grey.shade100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Attendance", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                              Text("Check In", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 15),),
                            ],
                          ),
                        ),
                        Container(
                          //color: Colors.grey.shade100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Notifications", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                              Text("7", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 15),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.symmetric(horizontal:10.0),
                    child:Container(
                      height:1.0,
                      width:377,
                      color:Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(7) ,
                  ),
                  Wrap(
                    children: <Widget>[
                      Container(
                        //color: Colors.grey.shade100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CircularPercentIndicator(
                              radius: 100.0,
                              lineWidth: 5.0,
                              animation: true,
                              percent: 0.7,
                              center: new Text(
                                "70.0%",
                                style:
                                new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                              ),
                              footer: new Text(
                                "Completed Task",
                                style:
                                new TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.green,
                            ),
                            CircularPercentIndicator(
                              radius: 100.0,
                              lineWidth: 5.0,
                              animation: true,
                              percent: 0.7,
                              center: new Text(
                                "70.0%",
                                style:
                                new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                              ),
                              footer: new Text(
                                "In Process Task",
                                style:
                                new TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Container(
                        //color: Colors.grey.shade100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CircularPercentIndicator(
                              radius: 100.0,
                              lineWidth: 5.0,
                              animation: true,
                              percent: 0.7,
                              center: new Text(
                                "70.0%",
                                style:
                                new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                              ),
                              footer: new Text(
                                "Unattended Logs",
                                style:
                                new TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.purple,
                            ),
                            CircularPercentIndicator(
                              radius: 100.0,
                              lineWidth: 5.0,
                              animation: true,
                              percent: 0.7,
                              center: new Text(
                                "70.0%",
                                style:
                                new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                              ),
                              footer: new Text(
                                "Unattended Tasks",
                                style:
                                new TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.orangeAccent,
                            ),
                          ],
                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                      ),
                      Container(
                        //color: Colors.grey.shade100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CircularPercentIndicator(
                              radius: 100.0,
                              lineWidth: 5.0,
                              animation: true,
                              percent: 0.7,
                              center: new Text(
                                "70.0%",
                                style:
                                new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                              ),
                              footer: new Text(
                                "Pending Tasks",
                                style:
                                new TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.red,
                            ),
                          ],
                        ),
                      ),

                      Container(
                        height: 370,
                        color: Colors.grey.shade100,
                       child: CustomTabApp(),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class EmployeeProfilePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EmployeeProfilePage_State();
  }

}

class _EmployeeProfilePage_State extends State<EmployeeProfilePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee Profile",style: TextStyle(color: Colors.white,fontFamily: 'Montserrat'),),
        iconTheme: IconThemeData(color: Colors.white,),
        backgroundColor: Colors.amber.shade400,
      ),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.amber.shade400,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.30,
            child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.green, Colors.redAccent]),
                  borderRadius: BorderRadius.circular(500),
                  border: Border.all( width: 2)),
              padding: EdgeInsets.all(3.0),
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.30,
              child: Card(
                elevation: 5,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text("0/0",
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),
                              ),
                              Text("All Logs",
                                style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                              ),
//                                style: GoogleFonts.cinzel(
//                                textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold ,fontSize: 15),
//                              ),
                              ),
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text("0", style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),),
                              Text("Solutions", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                              ),)
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text("0", style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),),
                              Text("Problem Solved", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                              ),)
                            ],
                          ),
                        ],

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text("1", style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),),
                              Text("Skills", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                              ),)
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text("0", style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),),
                              Text("Related Assets", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                              ),)
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text("0", style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),),
                              Text("Task Complete", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                              ),)
                            ],
                          ),
                        ],

                      ),
                    )
                  ],
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
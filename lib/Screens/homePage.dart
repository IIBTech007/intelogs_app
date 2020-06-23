import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intelogsapp/organization/skillsGroup.dart';
import 'package:intelogsapp/widgets/gridBox.dart';


class organizationalHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar( backgroundColor: Colors.amber[600],iconTheme: IconThemeData(color: Colors.white),
          title: Text('Organizational'),
          centerTitle: true,
        ),
        body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(12),
          crossAxisSpacing: 25,
          mainAxisSpacing: 25,
          crossAxisCount: 3,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(borderRadius: BorderRadius.circular(100.0),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>skillsGroup("abc")));

                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(

                      color: Colors.amber[600],
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Icon(FontAwesomeIcons.lightbulb,size: 40,color: Colors.white,),
                  ),
                ),
                SizedBox(height: 5,),
                Center(
                  child: const Text('Skills Group',style: TextStyle(fontWeight: FontWeight.bold,),),
                ),
              ],
            ),
            gridBox().gridbox("Skills", Icons.lightbulb_outline, () {
              print("functions working");
            }),
            gridBox().gridbox("Departments", Icons.view_compact, () {
              print("functions working");
            }),
            gridBox().gridbox("Sections", Icons.view_module, () {
              print("functions working");
            }),
            gridBox().gridbox("Shifts", Icons.group_work, () {
              print("functions working");
            }),
            gridBox().gridbox("Roles", FontAwesomeIcons.criticalRole, () {
              print("functions working");
            }),
            gridBox().gridbox("Position", FontAwesomeIcons.alignCenter, () {
              print("functions working");
            }),
            gridBox().gridbox("Employees", Icons.people, () {
              print("functions working");
            }),






          ],
        ),
      ),
    );
  }
}
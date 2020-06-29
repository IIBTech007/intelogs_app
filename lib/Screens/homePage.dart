import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intelogsapp/organization/SkillGroup/skillsGroup.dart';
import 'package:intelogsapp/organization/Skills/SkillsList.dart';
import 'package:intelogsapp/organization/department/departmentListPage.dart';
import 'package:intelogsapp/organization/position/pasitionListPage.dart';
import 'package:intelogsapp/organization/roles/rolesListPage.dart';
import 'package:intelogsapp/organization/section/sectionListPage.dart';
import 'package:intelogsapp/organization/shifts/shiftsListPage.dart';
import 'package:intelogsapp/widgets/gridBox.dart';
import 'package:shared_preferences/shared_preferences.dart';


class organizationalHomePage extends StatelessWidget {
  SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar( backgroundColor: Colors.amber[600],iconTheme: IconThemeData(color: Colors.white),
          title: Text('Organizational'),
          centerTitle: true,
        ),
        body: Center(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(12),
            crossAxisSpacing: 25,
            mainAxisSpacing: 25,
            crossAxisCount: 3,
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(borderRadius: BorderRadius.circular(100.0),
                    onTap: () async{
                      prefs= await SharedPreferences.getInstance();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>skillsGroup(prefs.getString("token"))));

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
              gridBox().gridbox("Skills", Icons.lightbulb_outline, () async{
                prefs= await SharedPreferences.getInstance();
                print(prefs.getString("token"));
                print("functions working");
                Navigator.push(context, MaterialPageRoute(builder: (context)=>skillsList(prefs.getString("token"))));
              }),
              gridBox().gridbox("Departments", Icons.view_compact, () async{
                prefs= await SharedPreferences.getInstance();
                print(prefs.getString("token"));
                Navigator.push(context, MaterialPageRoute(builder: (context)=>departmentPage(prefs.getString("token"))));
                print("functions working");
              }),
              gridBox().gridbox("Sections", Icons.view_module, () async{
                prefs= await SharedPreferences.getInstance();
                print(prefs.getString("token"));
                Navigator.push(context, MaterialPageRoute(builder: (context)=>sectionPage(prefs.getString("token"))));
                print("functions working");
              }),
              gridBox().gridbox("Shifts", Icons.group_work, () async{
                prefs= await SharedPreferences.getInstance();
                print(prefs.getString("token"));
                Navigator.push(context, MaterialPageRoute(builder: (context)=>shiftPage(prefs.getString("token"))));
                print("functions working");
              }),
              gridBox().gridbox("Roles", FontAwesomeIcons.criticalRole, () async{
                prefs= await SharedPreferences.getInstance();
                print(prefs.getString("token"));
                Navigator.push(context, MaterialPageRoute(builder: (context)=>rolePage(prefs.getString("token"))));
                print("functions working");
              }),
              gridBox().gridbox("Position", FontAwesomeIcons.alignCenter, () async{
                prefs= await SharedPreferences.getInstance();
                print(prefs.getString("token"));
                Navigator.push(context, MaterialPageRoute(builder: (context)=>positionPage(prefs.getString("token"))));
                print("functions working");
              }),
              gridBox().gridbox("Employees", Icons.people, () {
                print("functions working");
              }),






            ],
          ),
        ),
      ),
    );
  }
}
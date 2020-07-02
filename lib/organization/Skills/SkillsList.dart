import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intelogsapp/networks/organizationNetworks.dart';
import 'package:intelogsapp/utils/Utils.dart';
import 'package:intelogsapp/widgets/flushbar.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'AddSkill.dart';
import 'SkillsDetailsPage.dart';


class skillsList extends StatefulWidget{
  String token;


  skillsList (this.token);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Profile_Page_State(token);
  }

}
class _Profile_Page_State extends State<skillsList>{
  int id;
  SharedPreferences prefs;
  _Profile_Page_State (this.token);

  String token;
  var skillsList;
  var temp=[];


  @override
  void initState () {
    print(token);
    Utils.check_connectivity().then((result){
      if(result) {
        ProgressDialog pd = ProgressDialog(
            context, isDismissible: true, type: ProgressDialogType.Normal);
        pd.show();
        networks_helper.skillsList(token).then((response) {
          pd.hide();
          setState(() {
            print(response);
            skillsList = json.decode(response);
          });
        });
      }else
        flushBar().flushbar("Networks", "Please check your internet", 3, context);
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(title: Text("Skills"),
//          actions: <Widget>[
//          Center(child: Text("Add New",textScaleFactor: 1.3,)),
//          IconButton(
//
//            icon: Icon(
//              Icons.add,
//              color: Colors.white,
//            ),
//            onPressed: () {
//             // Navigator.push(context, MaterialPageRoute(builder: (context) => add_farrier(token)),);
//            },
//          )
//        ],
        ),floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),backgroundColor: Colors.amber[600],
          onPressed: () async{
           // prefs= await SharedPreferences.getInstance();
            print(token);
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddSkills(token)),);

          },
        ),

        body: ListView.builder(itemCount:skillsList!=null?skillsList.length:temp.length,itemBuilder: (context,int index){
          return Column(
            children: <Widget>[
              ListTile(
                //specifichorselab!=null?(specifichorselab[index]['testTypesdropDown']['name']):''
                //title: Text("skillsList"),
                title: Text(skillsList[index]['skill_name'].toString()!=null?skillsList[index]['skill_name'].toString():'empty'),
                //subtitle: Text("anc"),
                 subtitle: Text(skillsList[index]['skill_name_id'].toString()!= null?skillsList[index]['skill_name_id'].toString():'empty'),
                trailing: Icon(Icons.arrow_right),
                //leading: Image.asset("Assets/horses_icon.png"),
                onTap: ()async{
                  print(token);
                  print(skillsList[index]['skill_id']);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => skillsDetails(token,skillsList[index])),);
                },
              ),
              Divider(),
            ],

          );

        })
    );
  }

}

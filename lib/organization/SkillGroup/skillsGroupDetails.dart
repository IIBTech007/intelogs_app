import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intelogsapp/networks/organizationNetworks.dart';
import 'package:intelogsapp/widgets/detailPageWidgets/RowDetailPage.dart';
import 'package:intelogsapp/widgets/detailPageWidgets/detailPageDescription.dart';
import 'package:intelogsapp/widgets/flushbar.dart';

import 'editSkillsGroup.dart';


class SkillsGroupDetails extends StatefulWidget{
  String token;
  var specificskills;
  SkillsGroupDetails(this.token,this.specificskills);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _skills_group_details (token,specificskills);
  }

}

class _skills_group_details extends State<SkillsGroupDetails>{
  String token;
  var specificSkillGroup;
  _skills_group_details(this.token, this.specificSkillGroup);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade400,
        title: Text("Skills Group Details", style: TextStyle(fontFamily: 'Montserrat', fontSize: 25,color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white,),

//        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
               networks_helper.deleteSkillsGroup(token, specificSkillGroup['skill_group_id']).then((value) {
                 var res=jsonDecode(value);
                 if(res == true){
                   flushBar().flushbar("Skill Group", "Deleted", 4, context);
                 }
                 else{
                   flushBar().flushbar("Skill Group", "not deleted", 4, context);
                 }
               });
              },
                child: Icon(Icons.delete,color: Colors.white,)
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber[600],
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => editSkillGroup(token,specificSkillGroup)),);
        },
        child: Icon(Icons.edit),
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
            detailPageRowWidget().rowdetailpage("Name: ", specificSkillGroup['skill_group_name'], context),
            SizedBox(height: 5),
            detailPageRowWidget().rowdetailpage("Code: ", specificSkillGroup['skill_group_code'], context),
//            SizedBox(height: 5),
//            detailPageRowWidget().rowdetailpage("Name: ", "content", context),
            SizedBox(height: 5),
            detailPageDesciption().detailPagedesciption("Description", specificSkillGroup['skill_group_description'], context)
          ],
        ),
      ),
    );
  }
}
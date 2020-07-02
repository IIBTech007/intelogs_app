import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intelogsapp/json_services/api_services.dart';
import 'package:intelogsapp/utils/Utils.dart';
import 'package:intelogsapp/widgets/detailPageWidgets/RowDetailPage.dart';
import 'package:intelogsapp/widgets/detailPageWidgets/detailPageDescription.dart';
import 'package:intelogsapp/widgets/flushbar.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'editDepartment.dart';


class departmentDetails extends StatefulWidget{
  String token;
  var specificDepartment;
  departmentDetails(this.token,this.specificDepartment);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _skills_group_details (token,specificDepartment);
  }

}

class _skills_group_details extends State<departmentDetails>{
  String token;
  var specificDepartments;
  var specNew;
  _skills_group_details(this.token, this.specificDepartments);


  @override
  void initState() {
    Utils.check_connectivity().then((result){
      if(result) {
        ProgressDialog pd = ProgressDialog(
            context, isDismissible: true, type: ProgressDialogType.Normal);
        pd.show();
        networks_helper.specificDepartment(token,specificDepartments['comp_dept_id']).then((response) {
          pd.hide();
          setState(() {
            //print(response);
            specNew = json.decode(response);
            print(specNew);

          });
        });
      }else
        flushBar().flushbar("Networks", "Please check your internet", 3, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade400,
        title: Text("Skill Details"),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  print(token);
                  print(specificDepartments['skill_id']);
                  networks_helper.deleteSkills(token, specificDepartments['comp_dept_id']).then((value) {
                    if(value == true){
                      flushBar().flushbar("Skill", "Deleted", 4, context);
                      Navigator.of(context).pop();
                    }
                    else{
                      flushBar().flushbar("Skill ", "Not Deleted", 4, context);
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => editDepartment(token,specNew)),);
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
            detailPageRowWidget().rowdetailpage("Name: ", specNew['department_detail'][0]['comp_dept_name'], context),
            SizedBox(height: 5),
            detailPageRowWidget().rowdetailpage("Incharge: ", specNew['department_detail'][0]['emp_name'], context),
            SizedBox(height: 5),
            detailPageDesciption().detailPagedesciption("Description", specNew['department_detail'][0]['comp_dept_description'], context),
//            RaisedButton(
//                child: Text("data"),onPressed: (){
//                  print(token);
//              print(specNew['department_detail'][0]['comp_dept_name']);
//            })
          ],
        ),
      ),
    );
  }
}
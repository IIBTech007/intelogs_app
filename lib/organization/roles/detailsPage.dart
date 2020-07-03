import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intelogsapp/networks/organizationNetworks.dart';
import 'package:intelogsapp/utils/Utils.dart';
import 'package:intelogsapp/widgets/detailPageWidgets/RowDetailPage.dart';
import 'package:intelogsapp/widgets/detailPageWidgets/detailPageDescription.dart';
import 'package:intelogsapp/widgets/flushbar.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'editRoles.dart';



class rolesDetails extends StatefulWidget{
  String token;
  var specificRoleList;
  rolesDetails(this.token,this.specificRoleList);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _skills_group_details (token,specificRoleList);
  }

}

class _skills_group_details extends State<rolesDetails>{
  String token;
  var specificRoleList;
  //var specNew;
  _skills_group_details(this.token, this.specificRoleList);


  @override
  void initState() {
//    Utils.check_connectivity().then((result){
//      if(result) {
//        ProgressDialog pd = ProgressDialog(
//            context, isDismissible: true, type: ProgressDialogType.Normal);
//        pd.show();
//        networks_helper.specificRoles(token,specificRoleList['skill_id']).then((response) {
//          pd.hide();
//          setState(() {
//            //print(response);
//            specNew = json.decode(response);
//            print(specNew);
//
//          });
//        });
//      }else
//        flushBar().flushbar("Networks", "Please check your internet", 3, context);
//    });
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
                  print(specificRoleList['skill_id']);
                  networks_helper.deleterole(token, specificRoleList['perm_role_id']).then((value) {
                    if(value == true){
                      flushBar().flushbar("Roles ", "Deleted", 4, context);
                    }
                    else{
                      flushBar().flushbar("Roles ", "Not Deleted", 4, context);
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => editRoles(token,specificRoleList)),);
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
            detailPageRowWidget().rowdetailpage("Name: ", specificRoleList['perm_role_name'], context),
            SizedBox(height: 5),
            detailPageRowWidget().rowdetailpage("Code: ", specificRoleList['perm_role_id'], context),
            SizedBox(height: 5),
            detailPageDesciption().detailPagedesciption("Description", specificRoleList['role_description'], context),
          ],
        ),
      ),
    );
  }
}
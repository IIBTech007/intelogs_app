import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intelogsapp/json_services/api_services.dart';
import 'package:intelogsapp/organization/roles/add_roles.dart';
import 'package:intelogsapp/utils/Utils.dart';
import 'package:intelogsapp/widgets/flushbar.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';


class rolePage extends StatefulWidget{
  String token;


  rolePage (this.token);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Profile_Page_State(token);
  }

}
class _Profile_Page_State extends State<rolePage>{
  int id;
  SharedPreferences prefs;
  _Profile_Page_State (this.token);

  String token;
  var rolesList;
  var temp=[];


  @override
  void initState () {
    Utils.check_connectivity().then((result){
      if(result) {
        ProgressDialog pd = ProgressDialog(
            context, isDismissible: true, type: ProgressDialogType.Normal);
        pd.show();
        networks_helper.rolesList(token).then((response) {
          pd.hide();
          setState(() {
            print(response);
            rolesList = json.decode(response);
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
        appBar: AppBar(title: Text("Roles lis"),
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
          onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>AddRoles(token)));
          },
        ),

        body: ListView.builder(itemCount:rolesList!=null?rolesList.length:temp.length,itemBuilder: (context,int index){
          return Column(
            children: <Widget>[
              ListTile(
                //specifichorselab!=null?(specifichorselab[index]['testTypesdropDown']['name']):''
                title: Text(rolesList[index]['perm_role_name'].toString()!=null?rolesList[index]['perm_role_name'].toString():''),
               // subtitle: Text(rolesList[index]['skill_name_id'].toString()!= null?rolesList[index]['skill_name_id'].toString():''),
                trailing: Icon(Icons.arrow_right),
                //leading: Image.asset("Assets/horses_icon.png"),
                onTap: ()async{
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => SkillsGroupDetails("jP1RYdAj",rolesList[index])),);
                },
              ),
              Divider(),
            ],

          );

        })
    );
  }

}

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intelogsapp/networks/organizationNetworks.dart';
import 'package:intelogsapp/organization/roles/add_roles.dart';
import 'package:intelogsapp/utils/Utils.dart';
import 'package:intelogsapp/widgets/flushbar.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'permissionSubModule.dart';



class permissionPage extends StatefulWidget{
  String token;
  String roleName,description;


  permissionPage(this.token, this.roleName,this.description);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Profile_Page_State(token,roleName,description);
  }

}
class _Profile_Page_State extends State<permissionPage>{
  int id;
  bool checkBoxValue = true;
  SharedPreferences prefs;
  _Profile_Page_State (this.token,this.roleName,this.description);
  String token,roleName,description;
  var rolesList;
  var temp=[];
  bool readVal = false;
  bool writeVal = false;
  bool deleteVal = false;
  bool updateVal = false;
  bool listVal = false;

  Widget checkbox(String title, bool boolValue) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(title),
        Checkbox(
          value: boolValue,
          onChanged: (bool value) {
            /// manage the state of each value
            setState(() {
              switch (title) {
                case "Read":
                  readVal = value;

                  break;
                case "Write":
                  writeVal = value;
                  break;
                case "Delete":
                  deleteVal = value;
                  break;
                case "Update":
                  updateVal = value;
                  break;
                case "List":
                  listVal = value;
                  break;
              }
            });
          },
        )
      ],
    );
  }


  @override
  void initState () {
    Utils.check_connectivity().then((result){
      if(result) {
        ProgressDialog pd = ProgressDialog(
            context, isDismissible: true, type: ProgressDialogType.Normal);
        pd.show();
        networks_helper.permissionList(token).then((response) {
          pd.hide();
          setState(() {
            print(response);
            rolesList = json.decode(response);
          });
        });
      }else
        flushBar().flushbar("Networks", "Please check your internet", 3, context);
    });
   super.initState();
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
        ),
//        floatingActionButton: FloatingActionButton(
//          child: Icon(Icons.add),backgroundColor: Colors.amber[600],
//          onPressed: () {
//            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddRoles(token)));
//          },
//        ),

        body: ListView.builder(itemCount:rolesList!=null?rolesList.length:temp.length,itemBuilder: (context,int index){
          return Column(
            children: <Widget>[
              ListTile(
                title: Text(rolesList[index]['module_name']),
                subtitle: Text(rolesList[index]['child_mod_name']),
                trailing: Icon(Icons.arrow_right),
                onTap: ()async{
                   Navigator.push(context, MaterialPageRoute(builder: (context) => ChildModule(rolesList[index],token,roleName,description)),);
                },
//              children: <Widget>[
//                ListTile(
//                  title: Text(rolesList[index]['child_mod_name']),
//                  //trailing: Checkbox(value: false,),
//                ),
//                ListTile(
//                  //leading: Text("System Log"),
////                  title: Row(
////                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
////                    children: <Widget>[
////                      Text("Read"),
////                      Text("Write"),
////                      Text("Delete"),
////                      Text("Update"),
////                      Text("List"),
////
////
////                    ],
////                  ),
//                  title: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      checkbox("Write", writeVal),
//                      checkbox("Read", readVal),
//                      checkbox("Update", updateVal),
//                      checkbox("Delete", deleteVal),
//                      checkbox("List", listVal),
////                      MycheckBox().createState().checkbox("Write", writeVal),
////                      MycheckBox().createState().checkbox("Read", readVal),
////                      MycheckBox().createState().checkbox("Update", updateVal),
////                      MycheckBox().createState().checkbox("Delete", deleteVal),
////                      MycheckBox().createState().checkbox("List", listVal),
//
//
////                     Checkbox(tristate: true,),
////                      Checkbox(value: true,),
////                      Checkbox(value: true,),
////                     // Checkbox(value: checkBoxById(rolesList[index]['is_update']),),
////                      Checkbox(value: checkBoxValue,
////                          activeColor: Colors.green,
////                          onChanged:(bool newValue){
////                            setState(() {
////                              checkBoxValue = newValue;
////                            });
////                          }),
////                      Checkbox(value: true,),
//
//                    ],
//                  ),
//                ),
//
//              ],
              ),
              Divider(),
            ],
          );
        })
    );
  }
  bool checkBoxById(String num){
   bool value;
   if(num !=null) {
     if (num == "1") {
       value = false;
     }
     else if (num == "0") {
       value = true;
     }
   }
    return value;
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intelogsapp/networks/api_services.dart';
import 'package:intelogsapp/widgets/raisedButton.dart';
import 'package:intelogsapp/networks/organizationNetworks.dart';


import 'modules.dart';
import 'permission.dart';


class editPermissionPage extends StatefulWidget {
  var list;
  String token,roleId,roleName,description;

  editPermissionPage(this.list, this.token,this.roleId,this.roleName,this.description);

  @override
  _MyHomePageState createState() => _MyHomePageState(list,token,roleId,roleName,description);
}
class _MyHomePageState extends State<editPermissionPage> {
  var permissionList;
  List<Map> roles=[];
  List<permission> permissions=[];
  String token,roleId,roleName,description;

  _MyHomePageState(this.permissionList, this.token,this.roleId,this.roleName,this.description);

  bool createtrisatValue=false,listtrisatValue,readtrisatValue=false,updatetrisatValue=false,deletetrisatValue=false;
  bool readVal = false;
  bool writeVal = false;
  bool deleteVal = false;
  bool updateVal = false;
  bool listVal = false;


  @override
  void initState() {
    print('isRead '+permissionList['is_readList']);
    if (permissionList['is_readList'].toString() == '1') {
      setState(() {
        listtrisatValue = true;
        print(listtrisatValue);
      });
    }
    if(permissionList != null) {
      setState(() {
        if (permissionList['is_create'] == 1) {
          setState(() {
            createtrisatValue = true;
          });
        }
        else if (permissionList['is_read'] == 1) {
          setState(() {
            readtrisatValue = true;
          });
        }else if (permissionList['is_update'] == 1) {
          setState(() {
            updatetrisatValue = true;
          });
        }else if (permissionList['is_delete'] == 1) {
          setState(() {
            deletetrisatValue = true;
          });
        }
        else{
          setState(() {
            listtrisatValue = false;
          });

        }
      });
    }
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Child Module"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
//              select_value =  dropDown().dropdown(list, "Child Module", context),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(permissionList['child_mod_name'].toString(),style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    checkbox("Write", writeVal),
                    checkbox("Read", readVal),
                    checkbox("Delete", deleteVal),
                    checkbox("Update", updateVal),
                    checkbox("List", listVal),
//                   FlatButton(onPressed: (){
//                     print(listtrisatValue);
//                   }, child: null),
//                   // Checkbox(value: false, onChanged: null),
//                    Checkbox(
////                      title: Text("Checkbox Text"),
//                      value: listVal,
//                      onChanged: listtrisatValue
//                          ? (val) {
//                        setState(() {
//                          listVal = val;
//                        });
//                      }
//                          : null,
//                    ),
//
////                    Checkbox(tristate: true,),
//                    Checkbox(
//                        value: listVal,
//                        activeColor: Colors.green,
//                       // tristate: createtrisatValue!=true?writeVal:true,
//                        onChanged:(bool newValue){
//                          print(listtrisatValue);
//                          if(listtrisatValue != true){
//                           return null;
//                          }else{
//                            listVal = newValue;
//                          }
//                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              raisedButton().intelog_button("Save", Colors.amberAccent, Colors.amber[400], Colors.white, context, () {
                if(permissions!=null ){
                  permissions.clear();
                }if(roles!=null){
                  roles.clear();
                }

                if(readVal){
                  setState(() {
                    permissions.add(permission(name: 'Read',select: true));
                  });
                }if(writeVal){
                  setState(() {
                    permissions.add(permission(name: 'Create',select: true));
                  });
                }if(updateVal){
                  setState(() {
                    permissions.add(permission(name: 'Update',select: true));
                  });
                }
                if(deleteVal == true){
                  setState(() {
                    permissions.add(permission(name: 'Delete',select: true));
                  });
                }
                if(listVal == true){
                  setState(() {
                    permissions.add(permission(name: 'List',select: true));
                  });

                }


//                            permissions.add(permission(name: 'Create',select: true));
//                            permissions.add(permission(name: 'Delete',select: true));
                roles.add(modules(id: permissionList['module_id'],pid: permissionList['child_mod_id'],select: true,permissions: permissions).toJson());

                networks_helper.editRole(token,roleId,roleName, description, roles).then((response){

                  print(response);
                  print("add roles & permission response");
                  // jsonDecode(permissions);
                  print(readVal);
                  print(listVal);
                  var a = jsonEncode(roles);

                  print(a);
                });

              })
            ],
          ),
        )
    );
  }
}
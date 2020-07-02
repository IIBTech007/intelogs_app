import 'package:flutter/material.dart';
import 'package:intelogsapp/networks/api_services.dart';
import 'package:intelogsapp/widgets/raisedButton.dart';
import 'package:intelogsapp/networks/organizationNetworks.dart';


import 'modules.dart';
import 'permission.dart';


class ChildModule extends StatefulWidget {
  var list;
  String token,roleName,description;

  ChildModule(this.list, this.token,this.roleName,this.description);

  @override
  _MyHomePageState createState() => _MyHomePageState(list,token,roleName,description);
}
class _MyHomePageState extends State<ChildModule> {
  var permissionList;
  List<Map> roles=[];
  List<permission> permissions=[];
  String token,roleName,description;

  _MyHomePageState(this.permissionList, this.token,this.roleName,this.description);

  int selected_value_id;
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
                    checkbox("Update", updateVal),
                    checkbox("Delete", deleteVal),
                    checkbox("List", listVal),
                  ],
                ),
              ),
             SizedBox(
               height: 20,
             ),
             raisedButton().intelog_button("Save", Colors.amberAccent, Colors.amber[400], Colors.white, context, () {
               print(permissionList);

                  if(readVal == true){
                    permissions.add(permission(name: 'Read',select: true));
                  }else if(writeVal == true){
                    permissions.add(permission(name: 'Create',select: true));
                  }else if(updateVal == true){
                    permissions.add(permission(name: 'Update',select: true));
                  }
                  else if(writeVal == true){
                    permissions.add(permission(name: 'Delete',select: true));
                  }
                  else if(writeVal == true){
                    permissions.add(permission(name: 'List',select: true));
                  }


//                            permissions.add(permission(name: 'Create',select: true));
//                            permissions.add(permission(name: 'Delete',select: true));
                            roles.add(modules(id: permissionList['module_id'],pid: permissionList['child_mod_id'],select: true,permissions: permissions).toJson());

                             networks_helper.addRoles(token,roleName, description, roles).then((response){

                               print(response);
                               print("add roles & permission response");
                             });

             })
            ],
          ),
        )
    );
  }
}
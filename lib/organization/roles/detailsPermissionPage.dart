import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intelogsapp/networks/organizationNetworks.dart';
import 'package:intelogsapp/utils/Utils.dart';
import 'package:intelogsapp/widgets/flushbar.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'permissionSubModule.dart';



class detailsPermissions extends StatefulWidget{
  String token;
  var specificPermission;
  var specNew;


  detailsPermissions(this.token, this.specificPermission);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Profile_Page_State(token,specificPermission);
  }

}
class _Profile_Page_State extends State<detailsPermissions>{
  var specificPermissionList;
  var specNew;
  _Profile_Page_State (this.token,this.specificPermissionList);
  String token;
  var temp=[];


  @override
  void initState () {
    Utils.check_connectivity().then((result){
      if(result) {
        ProgressDialog pd = ProgressDialog(
            context, isDismissible: true, type: ProgressDialogType.Normal);
        pd.show();
        networks_helper.specificRoles(token,specificPermissionList['perm_role_id']).then((response) {
          pd.hide();
          setState(() {
            //print(response);
            var loadlist = json.decode(response);
            specNew = loadlist['permissions'];
            print(specNew);

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
        appBar: AppBar(title: Text("Permission List"),centerTitle: true,backgroundColor: Colors.amber.shade400,
        ),

        body: ListView.builder(itemCount:specNew!=null?specNew.length:temp.length,itemBuilder: (context,int index){
          return Column(
            children: <Widget>[
              ListTile(
                //title: Text("data"),
                title: Text(specNew[index]['module_name']!=null?specNew[index]['module_name']:""),
                subtitle: Text(specNew[index]['child_mod_name'] !=null? specNew[index]['child_mod_name']:""),
               // trailing: Icon(Icons.arrow_right),
                onTap: ()async{
                  print(specNew);
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => ChildModule(specificPermissionList[index],token,roleName,description)),);
                },

              ),
              Divider(),
            ],
          );
        })
    );
  }
}

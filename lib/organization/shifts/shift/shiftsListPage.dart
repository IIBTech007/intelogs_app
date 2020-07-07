import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intelogsapp/networks/organizationNetworks.dart';
import 'package:intelogsapp/utils/Utils.dart';
import 'package:intelogsapp/widgets/flushbar.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'addShifts.dart';
import 'shiftDetails.dart';


class shiftPage extends StatefulWidget{
  String token;


  shiftPage (this.token);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Profile_Page_State(token);
  }

}
class _Profile_Page_State extends State<shiftPage>{
  int id;
  SharedPreferences prefs;
  _Profile_Page_State (this.token);

  String token;
  var shiftList;
  var temp=[];


  @override
  void initState () {
    Utils.check_connectivity().then((result){
      if(result) {
        ProgressDialog pd = ProgressDialog(
            context, isDismissible: true, type: ProgressDialogType.Normal);
        pd.show();
        networks_helper.shiftsList(token).then((response) {
          pd.hide();
          setState(() {
            print(response);
            shiftList = json.decode(response);
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
          appBar: AppBar(title: Text("Shifts"),
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddShift(token)),);
          },
        ),

        body: ListView.builder(itemCount:shiftList!=null?shiftList.length:temp.length,itemBuilder: (context,int index){
          return Column(
            children: <Widget>[
              ListTile(
                //specifichorselab!=null?(specifichorselab[index]['testTypesdropDown']['name']):''
                title: Text(shiftList[index]['shift_name'].toString()!=null?shiftList[index]['shift_name'].toString():''),
                subtitle: Text(shiftList[index]['shift_duty_hours'].toString()!= null?"Duty Hour:"+shiftList[index]['shift_duty_hours'].toString():''),
                trailing: Icon(Icons.arrow_right),
                //leading: Image.asset("Assets/horses_icon.png"),
                onTap: ()async{
                   Navigator.push(context, MaterialPageRoute(builder: (context) => ShiftDetails(token,shiftList[index])),);
                },
              ),
              Divider(),
            ],

          );

        })
    );
  }

}

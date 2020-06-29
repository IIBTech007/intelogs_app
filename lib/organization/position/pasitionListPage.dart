import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intelogsapp/json_services/api_services.dart';
import 'package:intelogsapp/utils/Utils.dart';
import 'package:intelogsapp/widgets/flushbar.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';


class positionPage extends StatefulWidget{
  String token;


  positionPage (this.token);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Profile_Page_State(token);
  }

}
class _Profile_Page_State extends State<positionPage>{
  int id;
  SharedPreferences prefs;
  _Profile_Page_State (this.token);

  String token;
  var positionList;
  var temp=[];


  @override
  void initState () {
    Utils.check_connectivity().then((result){
      if(result) {
        ProgressDialog pd = ProgressDialog(
            context, isDismissible: true, type: ProgressDialogType.Normal);
        pd.show();
        networks_helper.positionList(token).then((response) {
          pd.hide();
          setState(() {
            print(response);
            positionList = json.decode(response);
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
          onPressed: () {

          },
        ),

        body: ListView.builder(itemCount:positionList!=null?positionList.length:temp.length,itemBuilder: (context,int index){
          return Column(
            children: <Widget>[
              ListTile(
                //specifichorselab!=null?(specifichorselab[index]['testTypesdropDown']['name']):''
                title: Text(positionList[index]['position_name'].toString()!=null?positionList[index]['position_name'].toString():''),
                subtitle: Text(positionList[index]['position_name_id'].toString()!= null?positionList[index]['position_name_id'].toString():''),
                trailing: Icon(Icons.arrow_right),
                //leading: Image.asset("Assets/horses_icon.png"),
                onTap: ()async{
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => SkillsGroupDetails("jP1RYdAj",positionList[index])),);
                },
              ),
              Divider(),
            ],

          );

        })
    );
  }

}

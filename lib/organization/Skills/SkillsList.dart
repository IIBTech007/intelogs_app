import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intelogsapp/json_services/api_services.dart';
import 'package:intelogsapp/utils/Utils.dart';
import 'package:intelogsapp/widgets/flushbar.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';


class skillsList extends StatefulWidget{
  String token;


  skillsList (this.token);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Profile_Page_State(token);
  }

}
class _Profile_Page_State extends State<skillsList>{
  int id;
  SharedPreferences prefs;
  _Profile_Page_State (this.token);

  String token;
  var skillsGroupList, load_list;
  var temp=[];


  @override
  void initState () {
//    networks_helper.skillsGroupDropdown(token).then((response){
//      setState(() {
//        print(response);
//        var dd =json.decode(response);
//        print(dd);
//
//      });
//
//    });
//    Add_horse_services.labdropdown(token).then((response){
//      setState((){
//        labdropDown = json.decode(response);
//      });
//    });

    Utils.check_connectivity().then((result){
      if(result) {
        ProgressDialog pd = ProgressDialog(
            context, isDismissible: true, type: ProgressDialogType.Normal);
        pd.show();
        networks_helper.skillsGroup("jP1RYdAj").then((response) {
          pd.hide();
          setState(() {
            print(response);
            skillsGroupList = json.decode(response);
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
        appBar: AppBar(title: Text("Skills Group"),
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
          child: Icon(Icons.add),
          onPressed: () {

          },
        ),

        body: ListView.builder(itemCount:skillsGroupList!=null?skillsGroupList.length:temp.length,itemBuilder: (context,int index){
          return Column(
            children: <Widget>[
              Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.20,
                actions: <Widget>[
                  IconSlideAction(onTap: ()async{
                    prefs = await SharedPreferences.getInstance();
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>update_farrier(skillsGroupList[index],token)));

                  },color: Colors.blue,icon: Icons.border_color,caption: 'update',),
                  IconSlideAction(
                    icon: Icons.visibility_off,
                    color: Colors.red,
                    caption: 'Hide',
                    onTap: () async {
                      networks_helper.skillsGroup(token).then((response){
                        //replytile.removeWhere((item) => item.id == horse_list[index]['horseId']);
                        //print(response);
                        if(response!=null){

                          Scaffold.of(context).showSnackBar(SnackBar(
                            backgroundColor:Colors.green ,
                            content: Text('Visibility Changed'),
                          ));

                        }else{
                          Scaffold.of(context).showSnackBar(SnackBar(
                            backgroundColor:Colors.red ,
                            content: Text('Failed'),
                          ));
                        }
                      });
                    },
                  ),

                ],
                child: ListTile(
                  //specifichorselab!=null?(specifichorselab[index]['testTypesdropDown']['name']):''
                  title: Text(skillsGroupList[index]['skill_group_name'].toString()!=null?skillsGroupList[index]['skill_group_name'].toString():''),
                  subtitle: Text(skillsGroupList[index]['skill_group_code'].toString()!= null?skillsGroupList[index]['skill_group_code'].toString():''),
                  trailing: Icon(Icons.arrow_right),
                  //leading: Image.asset("Assets/horses_icon.png"),
                  onTap: ()async{
                   // Navigator.push(context, MaterialPageRoute(builder: (context) => SkillsGroupDetails("jP1RYdAj",skillsGroupList[index])),);
                  },
                ),
                secondaryActions: <Widget>[

                ],

              ),
              Divider(),
            ],

          );

        })
    );
  }

}

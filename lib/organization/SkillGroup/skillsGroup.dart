import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intelogsapp/json_services/api_services.dart';
import 'package:intelogsapp/utils/Utils.dart';
import 'package:intelogsapp/widgets/flushbar.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'addSkillsGroup.dart';
import 'skillsGroupDetails.dart';


class skillsGroup extends StatefulWidget{
  String token;


  skillsGroup (this.token);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Profile_Page_State(token);
  }

}
class _Profile_Page_State extends State<skillsGroup>{
  int id;
  SharedPreferences prefs;
  _Profile_Page_State (this.token);
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  String token;
  var skillsGroupList;
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
            //print(response);
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
        appBar: AppBar(title: Text("Skills Group",style: TextStyle(color: Colors.white,fontFamily: 'Montserrat'),),
            iconTheme: IconThemeData(color: Colors.white,)
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber.shade400,
          child: Icon(Icons.add, color: Colors.white,),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddSkillsGroup(token)),);

          },
        ),

        body: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: (){
            return Utils.check_connectivity().then((result){
              if(result) {
                ProgressDialog pd = ProgressDialog(
                    context, isDismissible: true, type: ProgressDialogType.Normal);
                pd.show();
                networks_helper.skillsGroup(token).then((response) {
                  pd.hide();
                  setState(() {
                    print(response);
                    skillsGroupList = json.decode(response);
                  });
                });
              }else
                flushBar().flushbar("Networks", "Please check your internet", 3, context);
            });
            },
          child: ListView.builder(itemCount:skillsGroupList!=null?skillsGroupList.length:temp.length,itemBuilder: (context,int index){
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SkillsGroupDetails(token,skillsGroupList[index])),);
                    },
                  ),
                  secondaryActions: <Widget>[

                  ],

                ),
                Divider(),
              ],

            );

          }),
        )
    );
  }

}


















































//import 'dart:convert';
//
//import 'package:circular_profile_avatar/circular_profile_avatar.dart';
//import 'package:flutter/material.dart';
//import 'package:horse_management/HMS/All_Horses_data/farrier/add_farrier.dart';
//import 'package:horse_management/HMS/All_Horses_data/services/farrier_services.dart';
//import 'package:flutter_slidable/flutter_slidable.dart';
//import 'package:horse_management/HMS/Training/training_detail_page.dart';
//import 'package:horse_management/Network_Operations.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//
//
//
//class farrier_list extends StatefulWidget{
//  var list;
//  int horseId;
//  String token;
//
//
//  farrier_list ( this.token);
//
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _incomeExpense_list_state(token);
//  }
//
//}
//class _incomeExpense_list_state extends State<farrier_list>{
//  var list,incomelist;
//  int horseId;String token;
//  var temp=['',''];
//  SharedPreferences prefs;
//
//  _incomeExpense_list_state (this.token);
//
//
//  @override
//  void initState () {
////    income_expense_services.horseIdincomeExpense(token,1).then((
////        response) {
////      setState(() {
////        print(response);
////        incomelist = json.decode(response);
////      });
////    });
////    Add_horse_services.labdropdown(token).then((response){
////      setState((){
////        labdropDown = json.decode(response);
////      });
////    });
//
//    farrier_services.skillsGroupList(token).then((
//        response) {
//      setState(() {
//        print(response);
//        list = json.decode(response);
//      });
//    });
//
//
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    // TODO: implement build
//    return Scaffold(
//        appBar: AppBar(title: Text("Income & Expense "),actions: <Widget>[
//          Center(child: Text("Add New",textScaleFactor: 1.3,)),
//          IconButton(
//
//            icon: Icon(
//              Icons.add,
//              color: Colors.white,
//            ),
//            onPressed: () async{
//              prefs= await SharedPreferences.getInstance();
//              Navigator.push(context, MaterialPageRoute(builder: (context) => add_farrier(prefs.get('token'))),);
//            },
//          )
//        ],),
//        body:ListView.builder(itemCount:list!=null?list.length:temp.length,itemBuilder: (context,int index){
//          return Column(
//            children: <Widget>[
//              ExpansionTile(
//                //['categoryName']['name']
//                title: Text(list[index]['horseName']['name']),
//                trailing: Text(list[index]['date'].toString()),
//
//                children: <Widget>[
////
////                   ListTile(
////                    title: Text((list[index]['id'].toString())),
////                    //leading: Image.asset("Assets/horses_icon.png"),
////                    onTap: (){
////                      print((list[index]['id']));
////                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>horse_detail(horse_list[index])));
////                    },
////                  ),
////                  Divider(),
//                  ListTile(
//                    title: Text("Date"),
//                    trailing: Text(list[index]['date'].toString()),
//                    onTap: ()async{
//                      //list[index]['categoryDropDown']['categoryId']['name'].toString()
////                  print(incomelist['horseDropdown'][list[0]['horseId']]==['id']);
////                  print(incomelist['horseDropdown']);
////                  print(list);
//                      print(list[index]['id']);
//                      prefs= await SharedPreferences.getInstance();
//                      //Navigator.push(context, MaterialPageRoute(builder: (context) => update_IncomeExpense(list[index]['id'],prefs.get('token'),prefs.get('createdBy'))),);
//
//                    },
//                  ),
//                  Divider(),
//                  ListTile(
//                    title: Text("Cost Center"),
//                    trailing: Text(list[index]['costCenterId'].toString()),
//                  ),
//                  Divider(),
//                  ListTile(
//                    title: Text("Amount"),
//                    trailing: Text(list[index]['amount'].toString()),
//                  )
//
//                ],
//
//
//              ),
//              Divider(),
//            ],
//
//          );
//
//        })
//
//    );
//  }
//
//}
//
//

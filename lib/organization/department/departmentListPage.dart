import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intelogsapp/json_services/api_services.dart';
import 'package:intelogsapp/utils/Utils.dart';
import 'package:intelogsapp/widgets/flushbar.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'add_department.dart';
import 'departmentDetilPage.dart';


class departmentPage extends StatefulWidget{
  String token;


  departmentPage (this.token);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Profile_Page_State(token);
  }

}
class _Profile_Page_State extends State<departmentPage>{
  int id;
  SharedPreferences prefs;
  _Profile_Page_State (this.token);
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  String token;
  var departmentList;
  var temp=[];


  @override
  void initState () {
    Utils.check_connectivity().then((result){
      if(result) {
        ProgressDialog pd = ProgressDialog(
            context, isDismissible: true, type: ProgressDialogType.Normal);
        pd.show();
        networks_helper.departmentList(token).then((response) {
          pd.hide();
          setState(() {
//            print(response);
            departmentList = json.decode(response);
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
        appBar: AppBar(title: Text("Department",style: TextStyle(color: Colors.white,),),
            iconTheme: IconThemeData(color: Colors.white,)
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddDepartment(token)),);

          },
        ),

        body: RefreshIndicator(
            key: _refreshIndicatorKey,
             onRefresh: (){
               return  Utils.check_connectivity().then((result){
                 if(result) {
                   ProgressDialog pd = ProgressDialog(
                       context, isDismissible: true, type: ProgressDialogType.Normal);
                   pd.show();
                   networks_helper.departmentList(token).then((response) {
                     pd.hide();
                     setState(() {
//            print(response);
                       departmentList = json.decode(response);
                     });
                   });
                 }else
                   flushBar().flushbar("Networks", "Please check your internet", 3, context);
               });
             },
          child: ListView.builder(itemCount:departmentList!=null?departmentList.length:temp.length,itemBuilder: (context,int index){
            return Column(
              children: <Widget>[
                Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.20,
                  actions: <Widget>[
                    IconSlideAction(onTap: ()async{
                      prefs = await SharedPreferences.getInstance();
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>update_farrier(departmentList[index],token)));

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
                    title: Text(departmentList[index]['comp_dept_name'].toString()!=null?departmentList[index]['comp_dept_name'].toString():''),
                    subtitle: Text(departmentList[index]['comp_dept_name_id'].toString()!= null?departmentList[index]['comp_dept_name_id'].toString():''),
                    trailing: Icon(Icons.arrow_right),
                    //leading: Image.asset("Assets/horses_icon.png"),
                    onTap: ()async{
                       Navigator.push(context, MaterialPageRoute(builder: (context) => departmentDetails(token,departmentList[index])),);
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

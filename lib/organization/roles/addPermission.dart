import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class permissionPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Profile_Page_State();
  }

}
class _Profile_Page_State extends State<permissionPage>{
  int id;
  SharedPreferences prefs;

  String token;
  var rolesList;
  var temp=["",""];


  @override
  void initState () {
//    Utils.check_connectivity().then((result){
//      if(result) {
//        ProgressDialog pd = ProgressDialog(
//            context, isDismissible: true, type: ProgressDialogType.Normal);
//        pd.show();
//        networks_helper.rolesList(token).then((response) {
//          pd.hide();
//          setState(() {
//            print(response);
//            rolesList = json.decode(response);
//          });
//        });
//      }else
//        flushBar().flushbar("Networks", "Please check your internet", 3, context);
//    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(title: Text("Roles"),
        ),floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),backgroundColor: Colors.amber[600],
          onPressed: () {
          },
        ),

        body: ListView.builder(itemCount:1,itemBuilder: (context,int index){
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: <Widget>[
                RaisedButton(color: Colors.amber.shade600,child: Text("System"),
                    onPressed: null),
                RaisedButton(color: Colors.amber.shade600,child: Text("System"),
                    onPressed: null),
                RaisedButton(color: Colors.amber.shade600,child: Text("System"),
                    onPressed: null),
                RaisedButton(color: Colors.amber.shade600,child: Text("System"),
                    onPressed: null),
                RaisedButton(color: Colors.amber.shade600,child: Text("System"),
                    onPressed: null),
                RaisedButton(color: Colors.amber.shade600,child: Text("System"),
                    onPressed: null),
                RaisedButton(color: Colors.amber.shade600,child: Text("System"),
                    onPressed: null),
                Divider(),
              ],
            ),
          );
        })
    );
  }

}

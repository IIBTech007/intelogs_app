import 'package:flutter/material.dart';
import 'package:intelogsapp/widgets/raisedButton.dart';


class ChildModule extends StatefulWidget {
  var lsit;
  String token;

  ChildModule(this.lsit, this.token);

  @override
  _MyHomePageState createState() => _MyHomePageState(lsit,token);
}
class _MyHomePageState extends State<ChildModule> {
  var permissionList;
  String token;

  _MyHomePageState(this.permissionList, this.token);

  int selected_value_id;
  bool readVal = false;
  bool writeVal = false;
  bool deleteVal = false;
  bool updateVal = false;
  bool listVal = false;
  var select_value;
  var module_list;

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

            ],
          ),
        )
    );
  }
}
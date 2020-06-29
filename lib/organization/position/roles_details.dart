import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intelogsapp/organization/position/add_position_in_details.dart';
import 'package:intelogsapp/organization/position/permission_roles.dart';

class RolesDetails extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RolesDetails_State();
  }

}

class _RolesDetails_State extends State<RolesDetails> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade400,
        title: Text("Role"),
        centerTitle: true,
        actions: <Widget>[
//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: InkWell(
//                onTap: () {
//                  print(token);
//                  print(specificDepartments['skill_id']);
//                  networks_helper.deleteSkills(token, specificDepartments['comp_dept_id']).then((value) {
//                    if(value == true){
//                      flushBar().flushbar("Skill", "Deleted", 4, context);
//                    }
//                    else{
//                      flushBar().flushbar("Skill ", value, 4, context);
//                    }
//                  });
//                },
//                child: Icon(Icons.delete,color: Colors.white,)
//            ),
//          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber[600],
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => PermissionRoles("jP1RYdAj")),);
        },
        child: Icon(Icons.edit, color: Colors.white,),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              //padding: EdgeInsets.all(12),
              height: 200,
              //width: 370,
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.amber.shade400
                    ),
                    child: Center(
                      child: Text("Position Details", style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Name:", style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      Text("Organization Changer"),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Process Code:", style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      Text("Can Change Organizations"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ) ,
      ),
    );
  }
}
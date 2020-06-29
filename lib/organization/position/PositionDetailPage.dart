import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intelogsapp/organization/position/add_position_in_details.dart';
import 'package:intelogsapp/organization/position/roles_details.dart';

class PositionDetailPage extends StatefulWidget{
  String token;
  var specificPosition;
  PositionDetailPage(this.token,this.specificPosition);



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PositionDetail_State(token,specificPosition);
  }

}

class _PositionDetail_State extends State<PositionDetailPage>{
  String token;
  var specificPosition;
  var specNew;
  _PositionDetail_State(this.token, this.specificPosition);

//  @override
//  void initState() {
//    Utils.check_connectivity().then((result){
//      if(result) {
//        ProgressDialog pd = ProgressDialog(
//            context, isDismissible: true, type: ProgressDialogType.Normal);
//        pd.show();
//        networks_helper.specificDepartment(token,specificDepartments['comp_dept_id']).then((response) {
//          pd.hide();
//          setState(() {
//            //print(response);
//            specNew = json.decode(response);
//            print(specNew);
//
//          });
//        });
//      }else
//        flushBar().flushbar("Networks", "Please check your internet", 3, context);
//    });
//  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade400,
        title: Text("Position"),
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddPosition_in_Details(token)),);
        },
        child: Icon(Icons.edit),
      ),
      body: Container(
        //padding: EdgeInsets.only(left: 15, right: 15, top: 15 ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.start,
//          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              //padding: EdgeInsets.all(12),
              height: 250,
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
                      Text("Department Incharge"),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Position Code:", style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      Text("EP0002"),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Report To:", style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      Text("CEO"),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Work As:", style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      Text("Department Manager"),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Description:", style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      Text("A description"),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Container(padding: EdgeInsets.all(8),
              color: Colors.grey.shade200,
              child: Column(
                children: <Widget>[
                  Text("Permission Roles", style: TextStyle(
                      fontWeight: FontWeight.bold
                  ), ),
                  ListTile(
                    trailing: Icon(Icons.arrow_right),
                    title: Text("Organizational Incharge", ),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RolesDetails()),);
                    },
                  ),
                ],
              )

            ),

//            detailPageRowWidget().rowdetailpage("Name: ", specNew['department_detail'][0]['comp_dept_name'], context),
//            SizedBox(height: 5),
//            detailPageRowWidget().rowdetailpage("Incharge: ", specNew['department_detail'][0]['emp_name'], context),
//            SizedBox(height: 5),
//            detailPageDesciption().detailPagedesciption("Description", specNew['department_detail'][0]['comp_dept_description'], context),
//            RaisedButton(
//                child: Text("data"),onPressed: (){
//                  print(token);
//              print(specNew['department_detail'][0]['comp_dept_name']);
//            })
          ],
        ),
      ),
    );
  }
}
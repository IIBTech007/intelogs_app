import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intelogsapp/intellogs_assets/asset_group/editAssetGroup.dart';
import 'file:///C:/Users/WA/AndroidStudioProjects/intelogs_app/lib/organization/shifts/shift/editShifts.dart';
import 'package:intelogsapp/widgets/detailPageWidgets/RowDetailPage.dart';
import 'package:intelogsapp/widgets/detailPageWidgets/detailPageDescription.dart';


class ShiftDetails extends StatefulWidget{
  String token;
  var specificShift;
  ShiftDetails(this.token,this.specificShift);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ShiftDetails_State(token,specificShift);
  }

}

class _ShiftDetails_State extends State<ShiftDetails> {
  String token;
  var specificShift;
  var specNew;
  _ShiftDetails_State(this.token, this.specificShift);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade400,
        title: Text("Shifts Details", style: TextStyle(fontFamily: 'Montserrat', fontSize: 25,color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white,),

//        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
//                onTap: () {
//                  networks_helper.deleteSkillsGroup(token, specificSkillGroup['skill_group_id']).then((value) {
//                    var res=jsonDecode(value);
//                    if(res == true){
//                      flushBar().flushbar("Skill Group", "Deleted", 4, context);
//                    }
//                    else{
//                      flushBar().flushbar("Skill Group", "not deleted", 4, context);
//                    }
//                  });
//                },
                child: Icon(Icons.delete,color: Colors.white,)
            ),
          ),
        ],
      ),
      floatingActionButton: buildSpeedDial(),
      body: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 15 ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.start,
//          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            detailPageRowWidget().rowdetailpage(
                "Name: ",
                "Shift Category",
                //'specificAssets['skill_group_name']',
                context),
            SizedBox(height: 5),
            detailPageRowWidget().rowdetailpage(
                "Cartegory ID: ",
                "SD0001",
                //specificAssets['skill_group_code'],
                context),
            SizedBox(height: 5),
            detailPageRowWidget().rowdetailpage(
                "Duty Hours: ",
                "30",
                //specificAssets['skill_group_code'],
                context),
            SizedBox(height: 5),
            detailPageRowWidget().rowdetailpage(
                "Start Time: ",
                "12:00 AM",
                //specificAssets['skill_group_code'],
                context),
          ],
        ),
      ),
    );
  }
  SpeedDial buildSpeedDial() {
    return SpeedDial(
      backgroundColor: Colors.amber.shade400,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      // child: Icon(Icons.add),
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      //visible: dialVisible,
      curve: Curves.bounceIn,
      children: [
//        SpeedDialChild(
//          child: Icon(Icons.add, color: Colors.white),
//          backgroundColor: Colors.amber.shade400,
//          //onTap: () => print('FIRST CHILD'),
//          label: 'Add',
//          labelStyle: TextStyle(fontWeight: FontWeight.w500),
//          labelBackgroundColor: Colors.amber.shade400,
//        ),
        SpeedDialChild(
          child: Icon(Icons.brush, color: Colors.white),
          backgroundColor: Colors.amber.shade400,
          onTap: ()async{
            Navigator.push(context, MaterialPageRoute(builder: (context) => EditShift("jP1RYdAj",specificShift['i'])),);
          },
          //onTap: () => print('SECOND CHILD'),
          label: 'Edit',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: Colors.amber.shade400,
        ),
      ],
    );
  }
}
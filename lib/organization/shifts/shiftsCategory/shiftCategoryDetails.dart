import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intelogsapp/intellogs_assets/asset_group/editAssetGroup.dart';
import 'package:intelogsapp/widgets/detailPageWidgets/RowDetailPage.dart';
import 'package:intelogsapp/widgets/detailPageWidgets/detailPageDescription.dart';


class ShiftCategoryDetails extends StatefulWidget{
  String token;
  var specificCategory;
  ShiftCategoryDetails(this.token,this.specificCategory);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ShiftCategoryDetails_State(token,specificCategory);
  }

}

class _ShiftCategoryDetails_State extends State<ShiftCategoryDetails> {
  String token;
  var specificCategory;
  var specNew;
  _ShiftCategoryDetails_State(this.token, this.specificCategory);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade400,
        title: Text("Shifts Category Details", style: TextStyle(fontFamily: 'Montserrat', fontSize: 25,color: Colors.white),),
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
                "SC0001",
                //specificAssets['skill_group_code'],
                context),
            SizedBox(height: 5),
            detailPageRowWidget().rowdetailpage(
                "Duty Hours: ",
                "30",
                //specificAssets['skill_group_code'],
                context),
          ],
        ),
      ),
    );
  }
  SpeedDial buildSpeedDial() {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      // child: Icon(Icons.add),
      onOpen: () => print('OPENING DIAL'),
      onClose: () => print('DIAL CLOSED'),
      //visible: dialVisible,
      curve: Curves.bounceIn,
      children: [
        SpeedDialChild(
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: Colors.amber.shade400,
          //onTap: () => print('FIRST CHILD'),
          label: 'Add',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: Colors.amber.shade400,
        ),
        SpeedDialChild(
          child: Icon(Icons.brush, color: Colors.white),
          backgroundColor: Colors.amber.shade400,
          //onTap: () => print('SECOND CHILD'),
          label: 'Edit',
          labelStyle: TextStyle(fontWeight: FontWeight.w500),
          labelBackgroundColor: Colors.amber.shade400,
        ),
      ],
    );
  }
}
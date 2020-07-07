import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intelogsapp/intellogs_assets/asset_group/editAssetGroup.dart';
import 'package:intelogsapp/networks/organizationNetworks.dart';
import 'package:intelogsapp/utils/Utils.dart';
import 'package:intelogsapp/widgets/detailPageWidgets/RowDetailPage.dart';
import 'package:intelogsapp/widgets/detailPageWidgets/detailPageDescription.dart';
import 'package:intelogsapp/widgets/flushbar.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'shiftsCategoryList.dart';


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
  void initState() {
    Utils.check_connectivity().then((result){
      if(result) {
        ProgressDialog pd = ProgressDialog(
            context, isDismissible: true, type: ProgressDialogType.Normal);
        pd.show();

        networks_helper.detailShiftsGategory(token,specificCategory['cate_id']).then((response) {
          pd.hide();
          setState(() {
            //print(response);
            var loadlist = json.decode(response);
            specNew = loadlist['category_details'];

          });
        });
      }else
        flushBar().flushbar("Networks", "Please check your internet", 3, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade400,
        title: Text("Shifts Category Details", style: TextStyle(fontFamily: 'Montserrat', fontSize: 22,color: Colors.white),),
        iconTheme: IconThemeData(color: Colors.white,),
        centerTitle: true,
       // leading: IconButton(icon: Icon(Icons.keyboard_arrow_left), onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => ShiftsCategoryList(token)),)),

//        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  networks_helper.deleteShiftsGategory(token, specificCategory['cate_id']).then((value) {
                    print(value);
                    var res=jsonDecode(value);
                    if(res == true){
                      flushBar().flushbar("Shift Category", "Deleted", 4, context);
                    }
                    else{
                      flushBar().flushbar("Skill Group", "not deleted", 4, context);
                    }
                  });
                },
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
                specNew[0]['cate_name']!=null?specNew[0]['cate_name']:"",
                //'specificAssets['skill_group_name']',
                context),
            SizedBox(height: 5),
            detailPageRowWidget().rowdetailpage(
                "Cartegory Code: ",
                specNew[0]['cate_code']!=null?specNew[0]['cate_code']:"",
                //specificAssets['skill_group_code'],
                context),
            SizedBox(height: 5),
            detailPageRowWidget().rowdetailpage(
                "Duty Hours: ",
                specNew[0]['cate_duty_hours']!=null?specNew[0]['cate_duty_hours']:"",
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
      backgroundColor: Colors.amber[400],
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
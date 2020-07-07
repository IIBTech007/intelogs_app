import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:intelogsapp/networks/organizationNetworks.dart';
import 'package:intelogsapp/utils/Utils.dart';
import 'package:intelogsapp/widgets/flushbar.dart';
import 'package:progress_dialog/progress_dialog.dart';



class shiftListInCategoryPage extends StatefulWidget{
  String token;
  var specificShifts;


  shiftListInCategoryPage(this.token, this.specificShifts);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Profile_Page_State(token,specificShifts);
  }

}
class _Profile_Page_State extends State<shiftListInCategoryPage>{
  var specificShiftsList;
  var specNew;
  _Profile_Page_State (this.token,this.specificShiftsList);
  String token;
  var temp=[];


  @override
  void initState () {
    Utils.check_connectivity().then((result){
      if(result) {
        ProgressDialog pd = ProgressDialog(
            context, isDismissible: true, type: ProgressDialogType.Normal);
        pd.show();
        networks_helper.detailShiftsGategory(token,specificShiftsList['cate_id']).then((response) {
          pd.hide();
          setState(() {
            //print(response);
            var loadlist = json.decode(response);
            specNew = loadlist['shifts_detail'];
            print(specNew);

          });
        });
      }else
        flushBar().flushbar("Networks", "Please check your internet", 3, context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(backgroundColor: Colors.white,
        appBar: AppBar(title: Text("Permission List",style: TextStyle(fontFamily: 'Montserrat', fontSize: 22,color: Colors.white),),centerTitle: true,backgroundColor: Colors.amber.shade400,
        ),
        floatingActionButton: buildSpeedDial(),
        // appBar: AppBar(title: Text("Detail Page"),centerTitle: true,backgroundColor: Colors.transparent,),
        body: ListView.builder(itemCount:specNew!=null?specNew.length:temp.length,itemBuilder: (context,int index){
          return Column(
            children: <Widget>[
              ListTile(
                //title: Text("data"),
                title: Text(specNew[index]['shift_name']!=null?specNew[index]['shift_name']:""),
                subtitle: Text(specNew[index]['shift_duty_hours'] !=null? "Duty hour"+specNew[index]['shift_duty_hours']:""),
                // trailing: Icon(Icons.arrow_right),
                onTap: ()async{
                  //print(specNew);
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => ChildModule(specificShiftsList[index],token,roleName,description)),);
                },

              ),
              Divider(),
            ],
          );
        })
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

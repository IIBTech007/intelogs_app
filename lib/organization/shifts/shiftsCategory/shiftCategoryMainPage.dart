import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intelogsapp/networks/organizationNetworks.dart';
import 'package:intelogsapp/widgets/flushbar.dart';

import 'shiftCategoryDetails.dart';
import 'shiftsListInDetailPage.dart';



class shiftDetailMainPage extends StatefulWidget{
  String token;
  var specificlist;

  shiftDetailMainPage(this.token, this.specificlist);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DetailMainPage_State(token,specificlist);
  }

}



class _DetailMainPage_State extends State<shiftDetailMainPage>{
  String token;
  var specificlist;
  var specNew;
  _DetailMainPage_State(this.token, this.specificlist);

  int index = 0;

  @override
  void initState() {
//    print(specificlist);
//    Utils.check_connectivity().then((result){
//      if(result) {
//        ProgressDialog pd = ProgressDialog(
//            context, isDismissible: true, type: ProgressDialogType.Normal);
//        pd.show();
//
//        networks_helper.specificRoles(token,specificlist['perm_role_id']).then((response) {
//          pd.hide();
//          setState(() {
//            print(response);
//            specNew = json.decode(response);
//            print(specNew['permissions']);
//
//          });
//        });
//      }else
//        flushBar().flushbar("Networks", "Please check your internet", 3, context);
//    });
//    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: AppBar(title: Text("Shift Category"),
//        actions: <Widget>[
//          Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: InkWell(
//                onTap: () {
//                  networks_helper.deleteShiftsGategory(token, specificlist['cate_id']).then((value) {
//                    print(value);
//                    var res=jsonDecode(value);
//                    if(res == true){
//                      flushBar().flushbar("Shift Category", "Deleted", 4, context);
//                    }
//                    else{
//                      flushBar().flushbar("Skill Group", "not deleted", 4, context);
//                    }
//                  });
//                },
//                child: Icon(Icons.delete,color: Colors.white,)
//            ),
//          ),
//
//        ],
//
//      ),


      body: new Stack(
        children: <Widget>[
          new Offstage(
            offstage: index != 0,
            child: new TickerMode(
              enabled: index == 0,
              child: new MaterialApp(home: new ShiftCategoryDetails(token,specificlist)),
            ),
          ),
          new Offstage(
            offstage: index != 1,
            child: new TickerMode(
              enabled: index == 1,
              child: new MaterialApp(home: new shiftListInCategoryPage(token,specificlist)),
            ),
          ),
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: index,
        onTap: (int index) { setState((){ this.index = index; }); },
        items: <BottomNavigationBarItem>[
          new BottomNavigationBarItem(
            icon: new Icon(Icons.description),
            title: new Text("Details"),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.perm_data_setting),
            title: new Text("Shifts"),
          ),
        ],
      ),
    );
  }
}
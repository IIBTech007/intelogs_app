import 'package:flutter/material.dart';
import 'detailsPage.dart';
import 'detailsPermissionPage.dart';


class DetailMainPage extends StatefulWidget{
  String token;
  var specificlist;

  DetailMainPage(this.token, this.specificlist);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DetailMainPage_State(token,specificlist);
  }

}



class _DetailMainPage_State extends State<DetailMainPage>{
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
      body: new Stack(
        children: <Widget>[
          new Offstage(
            offstage: index != 0,
            child: new TickerMode(
              enabled: index == 0,
              child: new MaterialApp(home: new rolesDetails(token,specificlist)),
            ),
          ),
          new Offstage(
            offstage: index != 1,
            child: new TickerMode(
              enabled: index == 1,
              child: new MaterialApp(home: new detailsPermissions(token,specificlist)),
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
            title: new Text("Permission"),
          ),
        ],
      ),
    );
  }
}
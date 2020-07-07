import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intelogsapp/intellogs_assets/asset_group/editAssetGroup.dart';
import 'package:intelogsapp/organization/section/editSections.dart';
import 'package:intelogsapp/organization/section/sectionNetwork/sectionNetwork.dart';
import 'package:intelogsapp/utils/Utils.dart';
import 'package:intelogsapp/widgets/detailPageWidgets/RowDetailPage.dart';
import 'package:intelogsapp/widgets/detailPageWidgets/detailPageDescription.dart';
import 'package:intelogsapp/widgets/flushbar.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:intelogsapp/networks/organizationNetworks.dart';


class SectionDetails extends StatefulWidget{
  String token;
  var specificSection;
  SectionDetails(this.token,this.specificSection);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SectionDetails_State(token,specificSection);
  }

}

class _SectionDetails_State extends State<SectionDetails> {
  String token;
  var specificSection;
  var specNew;
  _SectionDetails_State(this.token, this.specificSection);


  @override
  void initState() {
    Utils.check_connectivity().then((result){
      if(result) {
        ProgressDialog pd = ProgressDialog(
            context, isDismissible: true, type: ProgressDialogType.Normal);
        pd.show();
        sections_network.specificSection(token,specificSection['section_id']).then((response) {
          pd.hide();
          setState(() {
            //print(response);

            var loadlist = json.decode(response);
            specNew = loadlist['section_detail'];
            print(specNew);

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
        title: Text("Section Details", style: TextStyle(fontFamily: 'Montserrat', fontSize: 25,color: Colors.white),),
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

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber[600],
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => EditSections(token,specificSection)),);
        },
        child: Icon(Icons.edit),
      ),
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
                "Department: ",
                specNew[0]['comp_dept_name'],
                context),
            SizedBox(height: 5),
            detailPageRowWidget().rowdetailpage(
                "Section Name: ",
                specNew[0]['section_name'],
                //specificSection['skill_group_code'],
                context),
            SizedBox(height: 5),
            detailPageRowWidget().rowdetailpage(
                "Section Incharge: ",
                specNew[0]['emp_name'],
                //specificSection['skill_group_code'],
                context),
            SizedBox(height: 5),
            detailPageRowWidget().rowdetailpage(
                "Section Code: ",
                specNew[0]['section_code'],
                //specificSection['skill_group_code'],
                context),
            SizedBox(height: 5),
//            SizedBox(height: 5),
//            detailPageRowWidget().rowdetailpage("Name: ", "content", context),
//            SizedBox(height: 5),
//            detailPageDesciption().detailPagedesciption(
//                "Description",
//                "This is decription",
//                //specificSection['skill_group_description'],
//                context
//            )
          ],
        ),
      ),
    );
  }
}
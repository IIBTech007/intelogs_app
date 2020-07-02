import 'package:flutter/material.dart';
import 'package:intelogsapp/widgets/detailPageWidgets/RowDetailPage.dart';
import 'package:intelogsapp/widgets/detailPageWidgets/detailPageDescription.dart';


class AssetsGeneralInformation extends StatefulWidget{
  String token;
  var specificAssets;
  AssetsGeneralInformation(this.token,this.specificAssets);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AssetsGeneralInformation_State(token,specificAssets);
  }

}

class _AssetsGeneralInformation_State extends State<AssetsGeneralInformation> {
  String token;
  var specificAssets;
  var specNew;
  _AssetsGeneralInformation_State(this.token, this.specificAssets);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade400,
        title: Text("Assets - General Information", style: TextStyle(fontFamily: 'Montserrat', fontSize: 25,color: Colors.white),),
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
         // Navigator.push(context, MaterialPageRoute(builder: (context) => editSkillGroup(token,specificSkillGroup)),);
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
                "Title: ",
                "Intellogs- Web",
                //'specificAssets['skill_group_name']',
                context),
            SizedBox(height: 5),
            detailPageRowWidget().rowdetailpage(
                "Code/ID: ",
                "A0001",
                //specificAssets['skill_group_code'],
                context),
            SizedBox(height: 5),
            detailPageRowWidget().rowdetailpage(
                "Department: ",
                "Intellogs",
                //specificAssets['skill_group_code'],
                context),
            SizedBox(height: 5),
            detailPageRowWidget().rowdetailpage(
                "Parent Group: ",
                "Lorem-Ipsum",
                //specificAssets['skill_group_code'],
                context),
            SizedBox(height: 5),
//            SizedBox(height: 5),
//            detailPageRowWidget().rowdetailpage("Name: ", "content", context),
            SizedBox(height: 5),
            detailPageDesciption().detailPagedesciption(
                "Description",
                "This is decription",
                //specificAssets['skill_group_description'],
                context
            )
          ],
        ),
      ),
    );
  }
}
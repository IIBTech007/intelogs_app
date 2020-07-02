import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intelogsapp/networks/organizationNetworks.dart';
import 'package:intelogsapp/utils/Utils.dart';
import 'package:intelogsapp/widgets/flushbar.dart';
import 'package:progress_dialog/progress_dialog.dart';


class editDepartment extends StatefulWidget {
  String token;
  var specificDepartment;
  editDepartment(this.token,this.specificDepartment);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return update_skill_state(token,specificDepartment);
  }

}

class update_skill_state  extends State<editDepartment> {
  String token;
  var specificDepartment;
  update_skill_state(this.token,this.specificDepartment);
  List<String> managers_list=[];
  String selected_manager,skill_weightage;
  int manager_id;
  TextEditingController name, description;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey();

  void initState() {// TODO: implement initState
    super.initState();
    name = TextEditingController();
    description = TextEditingController();
    setState(() {
      name.text= specificDepartment['comp_dept_name'];
      description.text= specificDepartment['comp_dept_description'];
    });
    print(token);
//    Utils.check_connectivity().then((result){
//      if(result) {
//        ProgressDialog pd = ProgressDialog(context, isDismissible: true, type: ProgressDialogType.Normal);
//        pd.show();
//        networks_helper.skillsGroup(token).then((response) {
//          pd.hide();
//          setState(() {
//            //print(response);
//            var skillsGroupList = json.decode(response);
//            print(skillsGroupList);
//            for(int i=0;i<skillsGroupList.length;i++)
//              managers_list.add(skillsGroupList[i]['managers_list_name']);
//            print(managers_list);
//          });
//        });
//      }else
//        flushBar().flushbar("Networks", "Please check your internet", 3, context);
//    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(title: Text("Update Skills",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        iconTheme: IconThemeData(color: Colors.white)),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Scrollbar(
            child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 100),
                  ),
                  FormBuilder(
                    key: _fbKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: FormBuilderTextField(
                            controller: name,
                            attribute: "name",
                            keyboardType: TextInputType.emailAddress,
                            validators: [FormBuilderValidators.required()],

                            decoration: InputDecoration(labelText: "Name", labelStyle: TextStyle(
                                color: Colors.amber.shade400,
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9.0),
                                  borderSide: BorderSide(color: Colors.amber.shade400, width: 3.0)
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: FormBuilderTextField(
                            //initialValue: specificDepartment['managers_list_description']!=null?specificDepartment['managers_list_description']:null,
                            controller: description,
                            attribute: "des",
                            keyboardType: TextInputType.emailAddress,
                            validators: [FormBuilderValidators.required()],

                            decoration: InputDecoration(labelText: "Description", labelStyle: TextStyle(
                                color: Colors.amber.shade400,
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9.0),
                                  borderSide: BorderSide(color: Colors.amber.shade400, width: 3.0)
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(1),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: FormBuilderDropdown(
                            //initialValue: specificDepartment['managers_list']!=null?specificDepartment['managers_list'].toString():"",
                            attribute: "manager",
                            validators: [FormBuilderValidators.required()],
                            hint: Text("Select Manager",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold)),
                            items: managers_list.map((name) => DropdownMenuItem(
                                value: name,
                                child: Text("$name",textScaleFactor:1.0,style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),)))
                                .toList(),
                            onChanged: (value){
                              setState(() {
                                selected_manager = value;
                                manager_id = managers_list.indexOf(value);
                              });
                            },
                            onSaved: (value){
                              setState(() {
                                selected_manager = value;
                                manager_id = managers_list.indexOf(value);
                                print(selected_manager);
                              });
                            },
                            style: Theme.of(context).textTheme.bodyText2,
                            decoration: InputDecoration(labelText: "+ Manager", labelStyle: TextStyle(
                              color: Colors.amber.shade400,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                              //icon: FaIcon(FontAwesomeIcons.question, color: Colors.amber.shade400,) ,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9.0),
                                  borderSide: BorderSide(color: Colors.amber.shade400, width: 3.0)
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          child: Container(
                            width: 300,
                            child: OutlineButton(
                              highlightedBorderColor: Colors.amber.shade400,
                              borderSide: BorderSide(color: Colors.amber.shade400, width: 2.0),
                              highlightElevation: 0.0,
                              splashColor: Colors.white,
                              highlightColor: Theme.of(context).primaryColor,
                              color: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              child: Text(
                                "Update",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber.shade400,
                                    fontSize: 20),
                              ),
                              onPressed: () {
                                if(_fbKey.currentState.saveAndValidate()) {
                                  print(selected_manager);
                                  ProgressDialog pd = ProgressDialog(context, type: ProgressDialogType.Normal);
                                  pd.show();
                                  networks_helper.editDepartment(token, specificDepartment['skill_id'], name.text, description.text,manager_id.toString())
                                      .then((value) {
                                    pd.hide();
                                    if (value == true) {
                                      flushBar().flushbar(
                                          "Skill", "successfully edit", 4,
                                          context);
                                    }
                                    else {
                                      flushBar().flushbar(
                                          "Skills", "Error occur", 4, context);
                                    }
                                  });
                                }
                              },
                            ),
                            height: 50,
                          ),
                          padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                        ),
                      ],
                    ),
                  )
                ]
            ),
          ),
        )
    );
  }
}
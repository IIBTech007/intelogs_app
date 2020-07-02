import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intelogsapp/networks/organizationNetworks.dart';
import 'package:intelogsapp/utils/Utils.dart';
import 'package:intelogsapp/widgets/flushbar.dart';
import 'package:progress_dialog/progress_dialog.dart';


class editSkill extends StatefulWidget {
  String token;
  var specificskill;
  editSkill(this.token,this.specificskill);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return update_skill_state(token,specificskill);
  }

}

class update_skill_state  extends State<editSkill> {
  String token;
  var specificskill;
  update_skill_state(this.token,this.specificskill);
  List<String> skill_group=[],skill_groups=[];
  String selected_skill,skill_weightage;
  TextEditingController name, description;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey();

  void initState() {// TODO: implement initState
    super.initState();
    name = TextEditingController();
    description = TextEditingController();
    setState(() {
      name.text= specificskill['skill_group_name'];
      description.text= specificskill['skill_group_description'];
    });
   print(token);
    Utils.check_connectivity().then((result){
      if(result) {
        ProgressDialog pd = ProgressDialog(
            context, isDismissible: true, type: ProgressDialogType.Normal);
        pd.show();
        networks_helper.skillsGroup(token).then((response) {
          pd.hide();
          setState(() {
            //print(response);
           var skillsGroupList = json.decode(response);
           print(skillsGroupList);
           for(int i=0;i<skillsGroupList.length;i++)
             skill_group.add(skillsGroupList[i]['skill_group_name']);
           print(skill_group);
          });
        });
      }else
        flushBar().flushbar("Networks", "Please check your internet", 3, context);
    });
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
                            //initialValue: specificskill['skill_group_description']!=null?specificskill['skill_group_description']:null,
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
                            //initialValue: specificskill['skill_group']!=null?specificskill['skill_group'].toString():"",
                            attribute: "SKILLS GROUP",
                            validators: [FormBuilderValidators.required()],
                            hint: Text("Select One",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold)),
                            items: skill_group.map((name) => DropdownMenuItem(
                                value: name,
                                child: Text("$name",textScaleFactor:1.0,style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),)))
                                .toList(),
                            onChanged: (value){
                              setState(() {
                                selected_skill = value;
                              });
                            },
                            onSaved: (value){
                              setState(() {
                                selected_skill = value;
                                print(selected_skill);
                              });
                            },
                            style: Theme.of(context).textTheme.bodyText2,
                            decoration: InputDecoration(labelText: "SKILL GROUP", labelStyle: TextStyle(
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
                          padding: EdgeInsets.all(10),
                          child: FormBuilderSlider(
                            attribute: "Company Employees",
                            validators: [FormBuilderValidators.min(100)],
                            min: 1,
                            max: 100,
                            onChanged: (value){
                              setState(() {
                                skill_weightage = value.toString().substring(0,3);
                                //print(NoOfEmployee);
                              });
                            },
                            initialValue: specificskill['skill_weightage']!=null ? double.parse(specificskill['skill_weightage']):1,
                            divisions: 99,
                            activeColor: Colors.amber.shade400,
                            inactiveColor: Colors.amber.shade400,
                            decoration:
                            InputDecoration( labelText: "COMPANY EMPLOYEES", labelStyle: TextStyle(
                                color: Colors.amber.shade400,
                                fontWeight: FontWeight.bold,
                                fontSize: 14
                            ),
                              // icon: FaIcon(FontAwesomeIcons.ups, color: Colors.amber.shade400,) ,
                              suffixIcon: Icon(FontAwesomeIcons.levelUpAlt),
                              prefixIcon: Icon(FontAwesomeIcons.levelDownAlt),
//                          border: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(9.0),
//                              borderSide: BorderSide(color: Colors.amber.shade400, width: 3.0)
//                          ),
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
                                  print(selected_skill);
                                  ProgressDialog pd = ProgressDialog(context, type: ProgressDialogType.Normal);
                                  pd.show();
                                  networks_helper.editSkills(token, specificskill['skill_id'], name.text, description.text,skill_weightage,selected_skill)
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
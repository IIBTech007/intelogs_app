import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intelogsapp/json_services/api_services.dart';
import 'package:intelogsapp/widgets/flushbar.dart';
import 'package:progress_dialog/progress_dialog.dart';

class AddSkills extends StatefulWidget{
  String token;

  AddSkills(this.token);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddSkillsState(token);
  }

}

class _AddSkillsState extends State<AddSkills> {
  String token;

  _AddSkillsState(this.token);

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey();
  TextEditingController skill_name, description;
  List<String> skill_group=[];
  String selected_skill,skill_weightage;
  int skill_group_id;


  @override
  void initState() {
    skill_name = TextEditingController();
    description = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Add Skills"),
        backgroundColor: Colors.amber.shade400,
      ),
      body: FormBuilder(
        key: _fbKey,
        child: SingleChildScrollView(

          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: FormBuilderTextField(
                  //initialValue: "Person Email",
                  controller: skill_name,
                  attribute: "Skill Group Name",
                  keyboardType: TextInputType.emailAddress,
                  validators: [FormBuilderValidators.required()],
                  decoration: InputDecoration(labelText: "SKILL GROUP NAME", labelStyle: TextStyle(
                      color: Colors.amber.shade400,
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),
                    //icon: FaIcon(FontAwesomeIcons.envelope, color: Colors.amber.shade400,) ,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        borderSide: BorderSide(color: Colors.amber.shade400, width: 3.0)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: FormBuilderDropdown(
                  //initialValue: "Select One",
                  attribute: "SKILLS GROUP",
                  validators: [FormBuilderValidators.required()],
                  hint: Text("Select One",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold)),
                  items: skill_group.map((name) => DropdownMenuItem(
                      value: name, child: Text("$name",textScaleFactor: 1.2,style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),)))
                      .toList(),
                  onChanged: (value){
                    setState(() {
                      selected_skill = value;
                      skill_group_id = skill_group.indexOf(value);
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
              Wrap(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8),
                    child: FormBuilderTextField(
                      //initialValue: "Person Email",
                      controller: description,
                      attribute: "Description",
                      minLines: 2,
                      keyboardType: TextInputType.emailAddress,
                      validators: [FormBuilderValidators.required()],
                      decoration: InputDecoration(labelText: "DESCRIPTION", labelStyle: TextStyle(
                          color: Colors.amber.shade400,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),
                        //icon: FaIcon(FontAwesomeIcons.envelope, color: Colors.amber.shade400,) ,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.0),
                            borderSide: BorderSide(color: Colors.amber.shade400, width: 3.0)
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
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
                      initialValue: 1,
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
                              suffixIcon: Icon(FontAwesomeIcons.levelDownAlt),
                              prefixIcon: Icon(FontAwesomeIcons.levelUpAlt),
//                          border: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(9.0),
//                              borderSide: BorderSide(color: Colors.amber.shade400, width: 3.0)
//                          ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(12),
              ),
              Padding(
                child: Container(
                  width: 300,
                  child: OutlineButton(
                    //highlightedBorderColor: Colors.amber.shade400,
                    borderSide: BorderSide(color: Colors.amber.shade400, width: 2.0),
                    highlightElevation: 0.0,
                    //splashColor: Colors.white,
                    highlightColor: Theme.of(context).primaryColor,
                    color: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),

                    ),
                    child: Text(
                      "ADD SKILLS",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.amber.shade400,
                          fontSize: 20),
                    ),
                        onPressed: () {
                          if(_fbKey.currentState.validate()) {
                            ProgressDialog pd = ProgressDialog(context, type: ProgressDialogType.Normal);
                            pd.show();
                            networks_helper.addSkills(token, skill_name.text,
                                description.text, selected_skill,
                                skill_weightage).then((value) {
                               pd.hide();
                               var res = jsonDecode(value);
                               if(res['error'] == false){
                                 flushBar().flushbar("Adding skills", "Successfully", 3, context);
                                 Navigator.pop(context);
                               }
                               else{
                                 flushBar().flushbar("Adding Skills", "Failed", 3, context);
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
        ),
      ),
    );
  }
}
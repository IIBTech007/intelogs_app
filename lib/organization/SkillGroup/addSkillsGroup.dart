import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intelogsapp/json_services/api_services.dart';
import 'package:intelogsapp/widgets/flushbar.dart';

class AddSkillsGroup extends StatefulWidget{
  String token;

  AddSkillsGroup(this.token);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddSkillsGroupState(token);
  }

}

class _AddSkillsGroupState extends State<AddSkillsGroup> {
  String token;

  _AddSkillsGroupState(this.token);

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey();
  TextEditingController skill_group_name, description;




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Skills Group",style: TextStyle(color: Colors.white,fontFamily: 'Montserrat'),),
        iconTheme: IconThemeData(color: Colors.white,),
        backgroundColor: Colors.amber.shade400,
    ),
          body: Container(
        color: Colors.white,
            child: FormBuilder(
              key: _fbKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: FormBuilderTextField(
                      //initialValue: "Person Email",
                      controller: skill_group_name,
                      attribute: "Skill Group Name",
                      //keyboardType: TextInputType.emailAddress,
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

                  Wrap(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8),
                        child: FormBuilderTextField(
                          //initialValue: "Person Email",
                          controller: description,
                          attribute: "Description",
                          //keyboardType: TextInputType.emailAddress,
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
                      )
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
                          "ADD SKILL GROUP",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.amber.shade400,
                              fontSize: 20),
                        ),
                        onPressed: () {
                          if(_fbKey.currentState.validate())
                          networks_helper.addSkillsGroup(token, skill_group_name.text, description.text).then((value){
                            var res = jsonDecode(value);
                            if(res['error']== false){
                              flushBar().flushbar("Add SkillGroup", res['message'], 3, context);
                              Navigator.pop(context);
                            }
                            else {
                              flushBar().flushbar("Add SkillGroup error", res['message'], 3, context);
                            }
                          });
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
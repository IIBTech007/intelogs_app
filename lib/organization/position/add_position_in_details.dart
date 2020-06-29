import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intelogsapp/widgets/flushbar.dart';



class AddPosition_in_Details extends StatefulWidget{
  String token;

  AddPosition_in_Details(this.token);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddPosition_in_Details_State(token);
  }

}

class _AddPosition_in_Details_State extends State<AddPosition_in_Details>{
  String token;
  _AddPosition_in_Details_State(this.token);
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey();
  TextEditingController position_name, description;
  List<String> add_skill=[], position_roles=[], position_as=[], report_to=[];
  String selected_skill,skill_position_role, selected_position_as, selected_report_to;
  int skill_id, position_role_id, position_as_id, report_to_id ;




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Position"),
        backgroundColor: Colors.amber.shade400,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber[600],
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => editDepartment(token,specNew)),);
        },
        child: Icon(Icons.add),
      ),
      body: Scrollbar(
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
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
                        controller: position_name,
                        attribute: "Position Name",
                        keyboardType: TextInputType.emailAddress,
                        validators: [FormBuilderValidators.required()],

                        decoration: InputDecoration(labelText: "POSITION NAME", labelStyle: TextStyle(
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
                      padding: EdgeInsets.all(8),
                      child: FormBuilderDropdown(
                        //initialValue: "Select One",
                        attribute: "Add Skills",
                        validators: [FormBuilderValidators.required()],
                        hint: Text("- Select(s) -",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold)),
                        items: add_skill.map((name) => DropdownMenuItem(
                            value: name, child: Text("$name",textScaleFactor: 1.2,style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),)))
                            .toList(),
                        onChanged: (value){
                          setState(() {
                            selected_skill = value;
                            skill_id = add_skill.indexOf(value);
                          });
                        },
                        style: Theme.of(context).textTheme.bodyText2,
                        decoration: InputDecoration(labelText: "ADD SKILLS", labelStyle: TextStyle(
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
                      padding: EdgeInsets.all(8),
                      child: FormBuilderDropdown(
                        //initialValue: "Select One",
                        attribute: "Position Roles",
                        validators: [FormBuilderValidators.required()],
                        hint: Text("- Select -",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold)),
                        items: position_roles.map((name) => DropdownMenuItem(
                            value: name, child: Text("$name",textScaleFactor: 1.2,style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),)))
                            .toList(),
                        onChanged: (value){
                          setState(() {
                            position_roles = value;
                            position_role_id = position_roles.indexOf(value);
                          });
                        },
                        style: Theme.of(context).textTheme.bodyText2,
                        decoration: InputDecoration(labelText: "POSITION ROLES", labelStyle: TextStyle(
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
                      padding: EdgeInsets.all(8),
                      child: FormBuilderDropdown(
                        //initialValue: "Select One",
                        attribute: "Position as",
                        validators: [FormBuilderValidators.required()],
                        hint: Text("- Select -",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold)),
                        items: position_as.map((name) => DropdownMenuItem(
                            value: name, child: Text("$name",textScaleFactor: 1.2,style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),)))
                            .toList(),
                        onChanged: (value){
                          setState(() {
                            position_as = value;
                            position_as_id = position_as.indexOf(value);
                          });
                        },
                        style: Theme.of(context).textTheme.bodyText2,
                        decoration: InputDecoration(labelText: "POSITION AS A", labelStyle: TextStyle(
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
                      padding: EdgeInsets.all(8),
                      child: FormBuilderDropdown(
                        //initialValue: "Select One",
                        attribute: "Report To",
                        validators: [FormBuilderValidators.required()],
                        hint: Text("- Select -",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold)),
                        items: report_to.map((name) => DropdownMenuItem(
                            value: name, child: Text("$name",textScaleFactor: 1.2,style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),)))
                            .toList(),
                        onChanged: (value){
                          setState(() {
                            selected_report_to = value;
                            report_to_id = report_to.indexOf(value);
                          });
                        },
                        style: Theme.of(context).textTheme.bodyText2,
                        decoration: InputDecoration(labelText: "REPORT TO", labelStyle: TextStyle(
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
                            "SAVE",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.amber.shade400,
                                fontSize: 20),
                          ),
                          onPressed: () {
//                            if(_fbKey.currentState.validate()) {
//                              ProgressDialog pd = ProgressDialog(context, type: ProgressDialogType.Normal);
//                              pd.show();
//                              networks_helper.addSkills(token, skill_name.text,
//                                  description.text, selected_skill,
//                                  skill_weightage).then((value) {
//                                pd.hide();
//                                var res = jsonDecode(value);
//                                if(res['error'] == false){
//                                  flushBar().flushbar("Adding skills", "Successfully", 3, context);
//                                  Navigator.pop(context);
//                                }
//                                else{
//                                  flushBar().flushbar("Adding Skills", "Failed", 3, context);
//                                }
//                              });
//                            }
                          },
                        ),
                        height: 50,
                      ),
                      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                    ),
                  ],
                ) ,
              ),
            )
          ],
        ),
      ),

    );
  }
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intelogsapp/json_services/api_services.dart';
import 'package:intelogsapp/organization/roles/permission.dart';
import 'package:intelogsapp/widgets/flushbar.dart';

import 'modules.dart';

class AddRoles extends StatefulWidget{
  String token;

  AddRoles(this.token);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddRoles_State(token);
  }

}

class _AddRoles_State extends State<AddRoles>{
  String token;
  List<Map> roles=[];
  List<permission> permissions=[];
  _AddRoles_State(this.token);
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey();
  TextEditingController role_name, description;
//  List<String> add_skill=[], position_roles=[], position_as=[], report_to=[];
//  String selected_skill,skill_position_role, selected_position_as, selected_report_to;
//  int skill_id, position_role_id, position_as_id, report_to_id ;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Role"),
        backgroundColor: Colors.amber.shade400,
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
                        controller: role_name,
                        attribute: "Role Name",
                        keyboardType: TextInputType.text,
                        validators: [FormBuilderValidators.required()],

                        decoration: InputDecoration(labelText: "ROLE NAME", labelStyle: TextStyle(
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
                            decoration: InputDecoration(labelText: "ROLE DESCRIPTION", labelStyle: TextStyle(
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
                            "SAVE",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.amber.shade400,
                                fontSize: 20),
                          ),
                          onPressed: () {
                            permissions.add(permission(name: 'Create',select: true));
                            permissions.add(permission(name: 'Delete',select: true));
                            roles.add(modules(id: '1',pid: '1',select: true,permissions: permissions).toJson());
                             networks_helper.addRoles(token, 'xyz', 'sfdsfd', roles).then((response){

                               print(response);
                               print("object");
                             });
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
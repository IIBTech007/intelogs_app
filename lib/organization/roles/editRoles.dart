import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intelogsapp/networks/organizationNetworks.dart';
import 'package:intelogsapp/organization/roles/permission.dart';
import 'package:intelogsapp/widgets/flushbar.dart';

import 'addPermission.dart';
import 'editPermissionList.dart';
import 'modules.dart';

class editRoles extends StatefulWidget{
  var specificRole;
  String token;

  editRoles(this.token,this.specificRole);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddRoles_State(token,specificRole);
  }

}

class _AddRoles_State extends State<editRoles>{
  String token;
  var specificRole;
//  List<Map> roles=[];
//  List<permission> permissions=[];
  _AddRoles_State(this.token,this.specificRole);
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey();
  TextEditingController role_id,role_name, description;

  @override
  void initState() {
    role_id = TextEditingController();
    role_name = TextEditingController();
    description = TextEditingController();
    setState(() {
      role_id.text = specificRole['perm_role_id'];
    role_name.text = specificRole['perm_role_name'];
      description.text = specificRole['role_description'];
    });
  } //  List<String> add_skill=[], position_roles=[], position_as=[], report_to=[];
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
                        controller: role_id,
                        attribute: "Role id",
                        keyboardType: TextInputType.text,
                        validators: [FormBuilderValidators.required()],
                        readOnly: true,
                        decoration: InputDecoration(labelText: "ROLE ID", labelStyle: TextStyle(
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
                            "Add Permission",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.amber.shade400,
                                fontSize: 20),
                          ),
                          onPressed: () {
                            if(_fbKey.currentState.validate()) {
                              print(role_name.text);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => editPermissionListPage(token,role_id.text,role_name.text,description.text)) );
                            }
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
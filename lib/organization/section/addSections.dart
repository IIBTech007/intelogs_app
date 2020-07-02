import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intelogsapp/json_services/api_services.dart';
import 'package:intelogsapp/utils/Utils.dart';
import 'package:intelogsapp/widgets/flushbar.dart';

class AddSections extends StatefulWidget{
  String token;

  AddSections(this.token);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddSections(token);
  }

}

class _AddSections extends State<AddSections> {
  String token;

  _AddSections(this.token);

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey();
  TextEditingController section_name;
  var sections_response;
  List<String> section_incharge=[];
  String selected_section_incharge;
  int section_incharge_id;

  void initState() {
    // TODO: implement initState
    super.initState();
    section_name = TextEditingController();
    Utils.check_connectivity().then((result){
      if(result){
        networks_helper.sections_incharge_dropdown(token).then((response){
          if(response!=null){
            print(response);
            setState(() {
              sections_response=json.decode(response);
              for(int i=0;i<sections_response.length;i++)
                section_incharge.add(sections_response[i]['emp_name']);
              print(section_incharge);
              //notes_loaded=true;
              //update_notes_visibility=true;
            });
          }
        });
      }else{
        print("Network Not Available");
      }
    });


    //description = TextEditingController();
//    setState(() {
//      position_name.text = specificDepartment['comp_dept_name'];
//      description.text = specificDepartment['comp_dept_description'];
//    });
  }





  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Sections",style: TextStyle(color: Colors.white,fontFamily: 'Montserrat'),),
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
                  controller: section_name,
                  attribute: "Section Name",
                  //keyboardType: TextInputType.emailAddress,
                  validators: [FormBuilderValidators.required()],
                  decoration: InputDecoration(labelText: "SECTION NAME", labelStyle: TextStyle(
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
                  attribute: "Section Incharge",
                  validators: [FormBuilderValidators.required()],
                  hint: Text("- Select -",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold)),
                  items: section_incharge.map((name) => DropdownMenuItem(
                      value: name, child: Text("$name",textScaleFactor: 1.2,style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),)))
                      .toList(),
                  onChanged: (value){
                    setState(() {
                      selected_section_incharge = value;
                      section_incharge_id = section_incharge.indexOf(value);
                    });
                  },
                  style: Theme.of(context).textTheme.bodyText2,
                  decoration: InputDecoration(labelText: "SECTION INCHARGE", labelStyle: TextStyle(
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
//                    onPressed: () {
//                      if(_fbKey.currentState.validate())
//                        networks_helper.addSkillsGroup(token, skill_group_name.text, description.text).then((value){
//                          var res = jsonDecode(value);
//                          if(res['error']== false){
//                            flushBar().flushbar("Add SkillGroup", res['message'], 3, context);
//                            Navigator.pop(context);
//                          }
//                          else {
//                            flushBar().flushbar("Add SkillGroup error", res['message'], 3, context);
//                          }
//                        });
//                    },
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
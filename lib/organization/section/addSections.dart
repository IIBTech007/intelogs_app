import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intelogsapp/networks/organizationNetworks.dart';
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
  List<String> section_incharge=[], department=[], shift_category=[];
  String selected_section_incharge, selected_department, selected_shift_category;
  int section_incharge_id, department_id, shift_category_id;

  void initState() {
    // TODO: implement initState
    super.initState();
    section_name = TextEditingController();
//    Utils.check_connectivity().then((result){
//      if(result){
//        networks_helper.sections_incharge_dropdown(token).then((response){
//          if(response!=null){
//            print(response);
//            setState(() {
//              sections_response=json.decode(response);
//              for(int i=0;i<sections_response.length;i++)
//                section_incharge.add(sections_response[i]['emp_name']);
//              print(section_incharge);
//              //notes_loaded=true;
//              //update_notes_visibility=true;
//            });
//          }
//        });
//      }else{
//        print("Network Not Available");
//      }
//    });


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
                padding: EdgeInsets.all(8),
                child: FormBuilderDropdown(
                  //initialValue: "Select One",
                  attribute: "Select Department",
                  validators: [FormBuilderValidators.required()],
                  hint: Text("- Select -",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold)),
                  items: department.map((name) => DropdownMenuItem(
                      value: name, child: Text("$name",textScaleFactor: 1.2,style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),)))
                      .toList(),
                  onChanged: (value){
                    setState(() {
                      selected_department = value;
                      department_id = department.indexOf(value);
                    });
                  },
                  style: Theme.of(context).textTheme.bodyText2,
                  decoration: InputDecoration(labelText: "SELECT DEPARTMENT", labelStyle: TextStyle(
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
                  attribute: "Shift Category",
                  validators: [FormBuilderValidators.required()],
                  hint: Text("- Select -",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold)),
                  items: shift_category.map((name) => DropdownMenuItem(
                      value: name, child: Text("$name",textScaleFactor: 1.2,style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),)))
                      .toList(),
                  onChanged: (value){
                    setState(() {
                      selected_shift_category = value;
                      shift_category_id = shift_category.indexOf(value);
                    });
                  },
                  style: Theme.of(context).textTheme.bodyText2,
                  decoration: InputDecoration(labelText: "SELECT SHIFT CATEGORY", labelStyle: TextStyle(
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
       // Container(
//                padding: EdgeInsets.all(16),
//                child: MultiSelectFormField(
//
//                  autovalidate: false,
//                  titleText: '+ Manager',
//
//                  validator: (value) {
//                    if (value == null || value.length == 0) {
//                      return 'Please select one or more options';
//                    }
//                  },
//                  dataSource: [
//                    {
//                      "display": "Manager 1",
//                      "value": "Running",
//                    },
//                    {
//                      "display": "Manager 2",
//                      "value": "Climbing",
//                    },
//                    {
//                      "display": "Manager 3",
//                      "value": "Walking",
//                    },
//                    {
//                      "display": "Manager 4",
//                      "value": "Swimming",
//                    },
//                    {
//                      "display": "Manager 5",
//                      "value": "Soccer Practice",
//                    },
//                    {
//                      "display": "Manager 7",
//                      "value": "Baseball Practice",
//                    },
//                    {
//                      "display": "Manager 8",
//                      "value": "Football Practice",
//                    },
//                  ],
//                  textField: 'display',
//                  valueField: 'value',
//                  okButtonLabel: 'OK',
//                  cancelButtonLabel: 'CANCEL',
//                  // required: true,
//                  hintText: 'Please choose one or more',
//                  //value: _myActivities,
//                  onSaved: (value) {
//                    if (value == null) return;
//                    setState(() {
//                      _myActivities = value;
//
//                    });
//                  },
//                ),
//              ),
//              Container(
//                padding: EdgeInsets.all(8),
//                child: RaisedButton(
//                  child: Text('Save'),
//                 // onPressed: _saveForm,
//                  onPressed: (){
//                    print(_myActivities);
//                    _myActivitiesResult = _myActivities.toString();
//                    print(_myActivitiesResult);
//                  },
//                ),
//              ),
//              Container(
//                padding: EdgeInsets.all(16),
//                child: Text(_myActivitiesResult),
//              ),
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
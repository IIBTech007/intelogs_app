import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intelogsapp/json_services/api_services.dart';
import 'package:intelogsapp/widgets/flushbar.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

class AddDepartment extends StatefulWidget{
  String token;

  AddDepartment(this.token);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddSkillsGroupState(token);
  }

}

class _AddSkillsGroupState extends State<AddDepartment> {
  String token;
  List _myActivities;
  String _myActivitiesResult;
  List<String> managers_list=["Manager 1","Manager 2"];
  String selected_manager;
  int manager_id;

  _AddSkillsGroupState(this.token);

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey();
  final formKey = new GlobalKey<FormState>();

  TextEditingController deparment_name, description;


  @override
  void initState() {
    deparment_name = TextEditingController();
    description = TextEditingController();
    _myActivities = [];
    _myActivitiesResult = '';

    super.initState();
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivitiesResult = _myActivities.toString();
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
//        fontFamily: 'Montserrat'
        title: Text("Add Department",style: TextStyle(color: Colors.white,),),
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
                  controller: deparment_name,
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
//              Container(
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
                      "ADD Department",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.amber.shade400,
                          fontSize: 20),
                    ),
                    onPressed: () {
                      if(_fbKey.currentState.validate())
                        networks_helper.addDepartment(token, deparment_name.text, description.text,selected_manager).then((value){
                          var res = jsonDecode(value);
                          if(res['error']== false){
                            flushBar().flushbar("Add Department", res['message'], 3, context);
                            Navigator.pop(context);
                          }
                          else {
                            flushBar().flushbar("Add Department", res['message'], 3, context);
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
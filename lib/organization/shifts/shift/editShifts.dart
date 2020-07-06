import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intelogsapp/networks/organizationNetworks.dart';
import 'package:intelogsapp/utils/Utils.dart';


class EditShift extends StatefulWidget{
  String token;
  var specificShift;

  EditShift(this.token, this.specificShift);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EditShift_State(token, specificShift);
  }

}

class _EditShift_State extends State<EditShift> {
  var specificShift;
  String token;
  _EditShift_State(this.token, this.specificShift);

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey();
  TextEditingController name, duty_hours;
  var shift_response;
  List<String> incharge=[];
  String selected_incharge;
  int incharge_id;
  var now = DateTime.now();
  //Duration initialtimer = new Duration();


  void initState() {
    // TODO: implement initState
    super.initState();
    name = TextEditingController();
    duty_hours = TextEditingController();
    Utils.check_connectivity().then((result){
      if(result){
        networks_helper.sections_incharge_dropdown(token).then((response){
          if(response!=null){
            print(response);
            setState(() {
              shift_response=json.decode(response);
              for(int i=0;i<shift_response.length;i++)
                incharge.add(shift_response[i]['emp_name']);
              print(shift_response);
              //notes_loaded=true;
              //update_notes_visibility=true;
            });
          }
        });
      }else{
        print("Network Not Available");
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    var today= new DateTime(now.year, now.month, now.day);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Shifts",style: TextStyle(color: Colors.white,fontFamily: 'Montserrat'),),
        iconTheme: IconThemeData(color: Colors.white,),
        backgroundColor: Colors.amber.shade400,
      ),
      body: SingleChildScrollView(
        child: Container(
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
                    controller: name,
                    attribute: "Name",
                    //keyboardType: TextInputType.emailAddress,
                    validators: [FormBuilderValidators.required()],
                    decoration: InputDecoration(labelText: "NAME", labelStyle: TextStyle(
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
                    attribute: "Select Incharge",
                    validators: [FormBuilderValidators.required()],
                    hint: Text("- Select -",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold)),
                    items: incharge.map((name) => DropdownMenuItem(
                        value: name, child: Text("$name",textScaleFactor: 1.2,style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),)))
                        .toList(),
                    onChanged: (value){
                      setState(() {
                        selected_incharge = value;
                        incharge_id = incharge.indexOf(value);
                      });
                    },
                    style: Theme.of(context).textTheme.bodyText2,
                    decoration: InputDecoration(labelText: "SELECT INCHARGE", labelStyle: TextStyle(
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
                  child: FormBuilderTextField(
                    //initialValue: "Person Email",
                    controller: duty_hours,
                    attribute: "Duty Hours",
                    keyboardType: TextInputType.datetime,
                    validators: [FormBuilderValidators.required()],
                    decoration: InputDecoration(labelText: "DUTY HOURS", labelStyle: TextStyle(
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
                  padding: EdgeInsets.only(right: 285),
                  child: Text("START TIME", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber.shade400
                  ),),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child:
//                 CupertinoTimerPicker(
//                   mode: CupertinoTimerPickerMode.hms,
//                   minuteInterval: 1,
//                   secondInterval: 1,
//                   initialTimerDuration: initialtimer,
//                   onTimerDurationChanged: (Duration changedtimer) {
//                     setState(() {
//                       initialtimer = changedtimer;
//                     });
//                   },
//                 )
                  CupertinoDatePicker(
                    minimumDate: today,
                    minuteInterval: 1,
                    mode: CupertinoDatePickerMode.time,
                    onDateTimeChanged: (DateTime time) {
                      print("dateTime: ${time}");
                    },
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
                        "UPDATE",
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
      ),
    );
  }
}
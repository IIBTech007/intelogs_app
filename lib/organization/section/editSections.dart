import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intelogsapp/networks/organizationNetworks.dart';
import 'package:intelogsapp/organization/section/addEmployeeToSection.dart';
import 'package:intelogsapp/organization/section/sectionNetwork/sectionNetwork.dart';
import 'package:intelogsapp/utils/Utils.dart';
import 'package:intelogsapp/widgets/flushbar.dart';


class EditSections extends StatefulWidget{
  String token;
  var specificSection;

  EditSections(this.token, this.specificSection);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EditSections_State(token, specificSection);
  }

}

class _EditSections_State extends State<EditSections> {
  var specificSection;
  String token;
  _EditSections_State(this.token, this.specificSection);

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey();
  TextEditingController name;
  var section_response;
  List<String> section_incharge=[], shift_category=[];
  String selected_incharge, selected_shift_category;
  int section_incharge_id, shift_category_id;

  //Duration initialtimer = new Duration();


  void initState() {
    // TODO: implement initState
    super.initState();
    name = TextEditingController();
    setState(() {
      name.text= specificSection['section_name'];
    });

    Utils.check_connectivity().then((result){
      if(result){
        networks_helper.sections_incharge_dropdown(token).then((response){
          if(response!=null){
            print(response);
            setState(() {
              section_response=json.decode(response);
              for(int i=0;i<section_response.length;i++)
                section_incharge.add(section_response[i]['emp_name']);
              print(section_response);
              //notes_loaded=true;
              //update_notes_visibility=true;
            });
          }
        });
        networks_helper.shiftGategories(token).then((response){
          if(response!=null){
            print(response);
            setState(() {
              section_response=json.decode(response);
              for(int i=0;i<section_response.length;i++)
                shift_category.add(section_response[i]['cate_name']);
              print(section_response);
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

    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber[600],
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddEmployeeToSection(token)),);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Edit Sections",style: TextStyle(color: Colors.white,fontFamily: 'Montserrat'),),
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
                        selected_incharge = value;
                        section_incharge_id = section_incharge.indexOf(value);
                        print(section_incharge_id);
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
                    onPressed: () {
                        print( specificSection['emp_name'][section_incharge_id]['emp_id']);
                      if(_fbKey.currentState.validate())
                       sections_network.editSection(token, specificSection['section_id'], name.text,"4", shift_category_id.toString())
                            .then((value){
                          var res = jsonDecode(value);
                          if(res['error']== false){
                            flushBar().flushbar("Edit Sections", res['message'], 3, context);
                            Navigator.pop(context);
                          }
                          else {
                            flushBar().flushbar("Edit Sections", res['message'], 3, context);
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
      ),
    );
  }
}
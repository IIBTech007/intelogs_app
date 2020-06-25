import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddSkills extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddSkillsState();
  }

}

class _AddSkillsState extends State<AddSkills> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey();
  TextEditingController skill_group_name, description;
  List<String> skill_group=[];
  String selected_skill_group;
  int skill_group_id;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Skills"),
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
                      selected_skill_group = value;
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
                      "ADD SKILLS",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.amber.shade400,
                          fontSize: 20),
                    ),
//                        onPressed: () {
//
//                          print(company_name.text);
//                          print(type_id.toString());
//                          print(NoOfEmployee);
//                          if(!Utils.validateEmail(person_email.text)){
//                            flushBar().flushbar("Email validation", "Please use avalid email", 4, context);
//                          }else{
//                            Utils.check_connectivity().then((result){
//                              if(result){
//                                if (_fbKey.currentState.validate()) {
//                                  var pd = ProgressDialog(context,
//                                      type: ProgressDialogType.Normal);
//                                  pd.show();
//                                  networks_helper.Sign_Up(
//                                      company_name.text, type_id.toString(),
//                                      NoOfEmployee, person_name.text,
//                                      person_email.text,
//                                      person_contact.text).then((
//                                      response) async {
//                                    pd.hide();
//                                    var res = jsonDecode(response);
//                                    print(res);
//                                    if (res['error'] != true) {
//                                      print("success");
//                                      Flushbar(
//                                        duration: Duration(seconds: 4), title: "Opps", //ignored since titleText != null
//                                        message: "error", //ignored since messageText != null
//                                        titleText: Text("SignUp",
//                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,
//                                              color: Colors.yellow[600], fontFamily: "ShadowsIntoLightTwo"),),
//                                        messageText: Text(res['message'], style: TextStyle(fontSize: 16.0,
//                                            color: Colors.green, fontFamily: "ShadowsIntoLightTwo"),),
//                                      )
//                                        ..show(context);
//                                    } else {
//                                      print(res['message']);
//                                      Flushbar(
//                                        duration: Duration(seconds: 4),
//                                        title: "Opps",
//                                        //ignored since titleText != null
//                                        message: "Error",
//                                        //ignored since messageText != null
//                                        titleText: Text("Signup",
//                                          style: TextStyle(
//                                              fontWeight: FontWeight.bold,
//                                              fontSize: 20.0,
//                                              color: Colors.yellow[600],
//                                              fontFamily: "ShadowsIntoLightTwo"),),
//                                        messageText: Text(res['message'],
//                                          style: TextStyle(fontSize: 16.0,
//                                              color: Colors.red,
//                                              fontFamily: "ShadowsIntoLightTwo"),),
//                                      )
//                                        ..show(context);
//                                    }
//                                  });
//                                }
//                              }else{
//                                flushBar().flushbar("Networks Error", "make sure your internet", 4, context);
//                              }
//                            });
//
//                          }
//
//                        },
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
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intelogsapp/json_services/api_services.dart';
import 'package:intelogsapp/widgets/flushbar.dart';


class editSkillGroup extends StatefulWidget {
  String token;
  var specificskill;
  editSkillGroup(this.token,this.specificskill);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginScreenState(token,specificskill);
  }

}

class LoginScreenState  extends State<editSkillGroup> {
  String token;
var specificskill;
  LoginScreenState(this.token,this.specificskill);

  TextEditingController name, description;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey();

  void initState() {// TODO: implement initState
    super.initState();
    name = TextEditingController();
    description = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(title: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        iconTheme: IconThemeData(color: Colors.white)),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.amber.shade400,
          child: Scrollbar(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 120),
                ),
                Container(
                  //height: 500,
                  height: MediaQuery.of(context).size.height  ,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                      )
                  ),
                  child: FormBuilder(
                    key: _fbKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: FormBuilderTextField(
                            initialValue: specificskill['skill_group_name'],
                            controller: name,
                            attribute: "name",
                            keyboardType: TextInputType.emailAddress,
                            validators: [FormBuilderValidators.required()],

                            decoration: InputDecoration(labelText: "Name", labelStyle: TextStyle(
                                color: Colors.amber.shade400,
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                              icon: FaIcon(FontAwesomeIcons.envelope, color: Colors.amber.shade400,) ,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(9.0),
                                  borderSide: BorderSide(color: Colors.amber.shade400, width: 3.0)
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: FormBuilderTextField(
                            initialValue: specificskill['skill_group_description'],
                            controller: description,
                            attribute: "des",
                            keyboardType: TextInputType.emailAddress,
                            validators: [FormBuilderValidators.required()],

                            decoration: InputDecoration(labelText: "Description", labelStyle: TextStyle(
                                color: Colors.amber.shade400,
                                fontWeight: FontWeight.bold,
                                fontSize: 15
                            ),
                              icon: FaIcon(FontAwesomeIcons.lock, color: Colors.amber.shade400,) ,
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
                              highlightedBorderColor: Colors.amber.shade400,
                              borderSide: BorderSide(color: Colors.amber.shade400, width: 2.0),
                              highlightElevation: 0.0,
                              splashColor: Colors.white,
                              highlightColor: Theme.of(context).primaryColor,
                              color: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                              child: Text(
                                "Update",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber.shade400,
                                    fontSize: 20),
                              ),
                              onPressed: () {
                               networks_helper.editSkillsGroup(token, specificskill['skill_group_id'], name.text, description.text).then((value) {
                                 if(value == true){
                                   flushBar().flushbar("Skill Group", "successfully edit", 4, context);
                                 }
                                 else{
                                   flushBar().flushbar("Skills", "Error occur", 4, context);
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
                )
              ]
            ),
          ),
        )
    );
  }
}
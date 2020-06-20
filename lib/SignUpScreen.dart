import 'dart:convert';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intelogsapp/json_services/api_services.dart';
import 'package:intelogsapp/utils/Utils.dart';
import 'package:intelogsapp/widgets/flushbar.dart';
import 'package:progress_dialog/progress_dialog.dart';


class SignupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
     return SignupScreenState();
  }

}

class SignupScreenState  extends State<SignupScreen> {
  List<String> company_type=["services","software"];
  TextEditingController company_name, person_name, person_email, person_contact;
  String NoOfEmployee,selected_type;
  int type_id;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey();

  void initState() {
    // TODO: implement initState
    super.initState();
    company_name = TextEditingController();
    person_name = TextEditingController();
    person_email = TextEditingController();
    person_contact = TextEditingController();

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
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
                      padding: EdgeInsets.all(15),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: FormBuilderTextField(
                        //initialValue: "Company name",
                        controller: company_name,
                        attribute: "Company Name",
                        //keyboardType: TextInputType.number,
                        validators: [FormBuilderValidators.required()],
                        decoration: InputDecoration(labelText: "COMPANY NAME", labelStyle: TextStyle(
                            color: Colors.amber.shade400,
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),
                          icon: FaIcon(FontAwesomeIcons.industry, color: Colors.amber.shade400,) ,

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
                        attribute: "COMPANY TYPE",
                        validators: [FormBuilderValidators.required()],
                        hint: Text("Select One",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold)),
                        items: company_type.map((name) => DropdownMenuItem(
                            value: name, child: Text("$name",textScaleFactor: 1.2,style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),)))
                            .toList(),
                        onChanged: (value){
                          setState(() {
                             selected_type = value;
                             type_id = company_type.indexOf(value);
                          });
                        },
                        style: Theme.of(context).textTheme.bodyText2,
                        decoration: InputDecoration(labelText: "COMPANY TYPE", labelStyle: TextStyle(
                          color: Colors.amber.shade400,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                          icon: FaIcon(FontAwesomeIcons.question, color: Colors.amber.shade400,) ,
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
                        //initialValue: "Person Name",
                        controller: person_name,
                        attribute: "Person Name",
                        keyboardType: TextInputType.text,
                        validators: [FormBuilderValidators.required()],
                        decoration: InputDecoration(labelText: "PERSON NAME", labelStyle: TextStyle(
                            color: Colors.amber.shade400,
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),
                          icon: FaIcon(FontAwesomeIcons.addressCard, color: Colors.amber.shade400,) ,
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
                        controller: person_email,
                        attribute: "Person Email",
                        keyboardType: TextInputType.emailAddress,
                        validators: [FormBuilderValidators.required()],

                        decoration: InputDecoration(labelText: "PERSON EMAIL", labelStyle: TextStyle(
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
                      padding: EdgeInsets.all(8),
                      child: FormBuilderTextField(

                        //initialValue: "Person Contact",
                        controller: person_contact,
                        attribute: "Person Contact",
                        keyboardType: TextInputType.number,
                        validators: [FormBuilderValidators.required()],
                        decoration: InputDecoration(
                          icon: FaIcon(FontAwesomeIcons.phone, color: Colors.amber.shade400,) ,
                          //prefixIcon: FaIcon(FontAwesomeIcons.envelope),
                          labelText: "PERSON CONTACT", labelStyle: TextStyle(
                            color: Colors.amber.shade400,
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9.0),
                              borderSide: BorderSide(color: Colors.amber.shade400, width: 3.0)
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: FormBuilderSlider(
                        attribute: "Company Employees",
                        validators: [FormBuilderValidators.min(200)],
                        min: 100,
                        max: 500,
                        onChanged: (value){
                          setState(() {
                           NoOfEmployee = value.toString().substring(0,3);
                           //print(NoOfEmployee);
                          });
                        },
                       initialValue: 100,
                        divisions: 400,
                        activeColor: Colors.amber.shade400,
                        inactiveColor: Colors.amber.shade400,
                        decoration:
                        InputDecoration( labelText: "COMPANY EMPLOYEES", labelStyle: TextStyle(
                            color: Colors.amber.shade400,
                            fontWeight: FontWeight.bold,
                            fontSize: 14
                        ),
                          icon: FaIcon(FontAwesomeIcons.user, color: Colors.amber.shade400,) ,

//                          border: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(9.0),
//                              borderSide: BorderSide(color: Colors.amber.shade400, width: 3.0)
//                          ),
                        ),
                      ),
                    ),

            ///Ek ye b slider hai check kr lena neechy wala jo comment kia howa hai agr FormBuilderSlider na set howa iss sy upr wala

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
                            "REGISTER",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.amber.shade400,
                                fontSize: 20),
                          ),
                          onPressed: () {
                             if(!Utils.validateEmail(person_email.text)){
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text("Email Format is Invalid"),
                                backgroundColor: Colors.red,
                              ));
                             }else{
                               Utils.check_connectivity().then((result){
                                 if(result){
                                   var pd= ProgressDialog(context, type: ProgressDialogType.Normal);
                                   pd.show();
                                   networks_helper.Sign_Up(company_name.text,type_id.toString(),NoOfEmployee,person_name.text, "example@mail.com",person_contact.text).then((response) async{
                                     pd.hide();
                                     var res = jsonDecode(response);
                                     if(res['error']!=true){
                                       print("success");
                                       Flushbar(
                                         duration: Duration(seconds: 4),
                                         title: "Opps", //ignored since titleText != null
                                         message: "error", //ignored since messageText != null
                                         titleText: Text("SignUp", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.yellow[600], fontFamily:"ShadowsIntoLightTwo"),),
                                         messageText: Text(" Successfully!", style: TextStyle(fontSize: 16.0, color: Colors.green,fontFamily: "ShadowsIntoLightTwo"),),
                                       )..show(context);

                                     }else{
                                       print(res['message']);
                                       Flushbar(
                                         duration: Duration(seconds: 4),
                                         title: "Opps", //ignored since titleText != null
                                         message: "Error", //ignored since messageText != null
                                         titleText: Text("Signup", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.yellow[600], fontFamily:"ShadowsIntoLightTwo"),),
                                         messageText: Text(res['message'], style: TextStyle(fontSize: 16.0, color: Colors.red,fontFamily: "ShadowsIntoLightTwo"),),
                                       )..show(context);
                                     }
                                   });
                                 }else{
                                   flushBar().flushbar("Networks Error", "make sure your internet", 4, context);
                                 }
                               });

                             }

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
            ],
          ),
        ),
      )
    );
  }
}
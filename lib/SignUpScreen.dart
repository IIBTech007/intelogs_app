import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
     return SignupScreenState();
  }

}

class SignupScreenState  extends State<SignupScreen> {
  List<String> company_type=[];
  TextEditingController company_name, person_name, person_email, person_contact;

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
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: FormBuilderTextField(
                      initialValue: "Company name",
                      //controller: company_name,
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
                      initialValue: 10,
                      attribute: "COMPANY TYPE",
                      validators: [FormBuilderValidators.required()],
                      hint: Text("Check Method"),
                      items: company_type.map((name) => DropdownMenuItem(
                          value: name, child: Text("$name")))
                          .toList(),
                      onChanged: (value){
                        setState(() {

                        });
                      },
                      style: Theme.of(context).textTheme.body1,
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
                      initialValue: "Person Name",
                      //controller: company_name,
                      attribute: "Person Name",
                      //keyboardType: TextInputType.number,
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
                      initialValue: "Person Email",
                      //controller: company_name,
                      attribute: "Person Email",
                      //keyboardType: TextInputType.number,
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
                      initialValue: "Person Contact",
                      //controller: company_name,
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
                    padding: EdgeInsets.all(8),
                    child: FormBuilderSlider(
                      attribute: "Company Employees",
                      validators: [FormBuilderValidators.min(6)],
                      min: 1,
                      max: 500,
                      initialValue: 1,
                      divisions: 5,
                      decoration:
                      InputDecoration( labelText: "COMPANY EMPLOYEES", labelStyle: TextStyle(
                          color: Colors.amber.shade400,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),
                        icon: FaIcon(FontAwesomeIcons.user, color: Colors.amber.shade400,) ,

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9.0),
                            borderSide: BorderSide(color: Colors.amber.shade400, width: 3.0)
                        ),
                      ),
                    ),
                  ),

            ///Ek ye b slider hai check kr lena neechy wala jo comment kia howa hai agr FormBuilderSlider na set howa iss sy upr wala
//                  Container(
//                    width: 370,
//                    //width: MediaQuery.of(context).size.width,
//                    padding: EdgeInsets.only(left: 25, right: 25,),
//                    decoration: BoxDecoration(
//                      border: Border.all(color: Colors.amber.shade400, width: 3),
//                      borderRadius: BorderRadius.circular(30),
//                      //color: Colors.amber.shade400
//                    ),
//                    child: Column(
//                      children: <Widget>[
//                        Padding(
//                          padding: EdgeInsets.only(top: 13),
//                        ),
//                        Text("COMPANY EMPLOYEES", style: TextStyle(
//                            color: Colors.amber.shade400,
//                            fontWeight: FontWeight.bold,
//                            fontSize: 20
//                        ),
//                        ),
//                        Padding(
//                            padding: EdgeInsets.only(bottom: 15, top: 15),
//                            child: FlutterSlider(
//
////                                  decoration: (
////                                  ),
////                                  decoration: BoxDecoration(
////                                      color: Colors.amber.shade400
////                                  ),
//                              values: [300],
//                              max: 500,
//                              min: 100,
//                              onDragging: (handlerIndex, lowerValue, upperValue) {
//                                _lowerValue = lowerValue;
//                                _upperValue = upperValue;
//                                setState(() {});
//                              },
//                            )
////                        _input(FaIcon(FontAwesomeIcons.user), "COMPANY EMPLOYEES",
////                            _companyEmployeesController, true),
//                        ),
//                      ],
//                    ),
//                  ),
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

                        },
                      ),
                      height: 50,
                    ),
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                  ),
                ],
              ),
            )
            ],
          ),
        ),
      )
    );
  }
}
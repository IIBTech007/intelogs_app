import 'dart:convert';

import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intelogsapp/json_services/api_services.dart';
import '../utils/clipper.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _companyNameController = new TextEditingController();
  TextEditingController _companyTypeController = new TextEditingController();
  TextEditingController _companyEmployeesController = new TextEditingController();
  TextEditingController _personNameController = new TextEditingController();
  TextEditingController _personContactController = new TextEditingController();

  String _email;
  String _company_name;
  String _company_type;
  String _company_employees;
  String _personContact;
  String _personName;
  String _password;
  String _displayName;
  double _lowerValue;
  double _upperValue;
  bool _obsecure = false;

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    void initState() {
      super.initState();
    }

    //GO logo widget
    Widget logo() {
      return Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 220,
          child: Stack(
            children: <Widget>[
//              Positioned(
//                  child: Container(
//                child: Align(
//                  child: Container(
//                    decoration: BoxDecoration(
//                        shape: BoxShape.circle, color: Colors.white),
//                    width: 150,
//                    height: 150,
//                  ),
//                ),
//                height: 154,
//              )),
              Positioned(
                child: Container(
                    height: 154,
                    child: Align(
                      child: Image.asset('assets/Intellogs.png',width: 340,height: 340,),
//                      child: Text(
//                        "GO",
//                        style: TextStyle(
//                          fontSize: 120,
//                          fontWeight: FontWeight.bold,
//                          color: Theme.of(context).primaryColor,
//                        ),
//                      ),
                    )),
              ),
//              Positioned(
//                width: MediaQuery.of(context).size.width * 0.15,
//                height: MediaQuery.of(context).size.width * 0.15,
//                bottom: MediaQuery.of(context).size.height * 0.046,
//                right: MediaQuery.of(context).size.width * 0.22,
//                child: Container(
//                  decoration: BoxDecoration(
//                      shape: BoxShape.circle, color: Colors.white),
//                ),
//              ),
//              Positioned(
//                width: MediaQuery.of(context).size.width * 0.08,
//                height: MediaQuery.of(context).size.width * 0.08,
//                bottom: 0,
//                right: MediaQuery.of(context).size.width * 0.32,
//                child: Container(
//                  decoration: BoxDecoration(
//                      shape: BoxShape.circle, color: Colors.white),
//                ),
//              ),
            ],
          ),
        ),
      );
    }

    //input widget
    Widget _input(FaIcon icon, String hint, TextEditingController controller,
        bool obsecure) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obsecure,
          style: TextStyle(
            fontSize: 15,
          ),
          decoration: InputDecoration(
              hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              hintText: hint,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 3,
                ),
              ),
              prefixIcon: Padding(
                child: IconTheme(
                  data: IconThemeData(color: Theme.of(context).primaryColor),
                  child: icon,
                ),
                padding: EdgeInsets.only(left: 30, right: 10, top: 10),
              )
          ),
        ),
      );
    }

    //button widget
    Widget login_button(String text, Color splashColor, Color highlightColor,
        Color fillColor, Color textColor, void function()) {
      return RaisedButton(
        highlightElevation: 0.0,
        splashColor: splashColor,
        highlightColor: highlightColor,
        elevation: 0.0,
        color: fillColor,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: textColor, fontSize: 20),
        ),
        onPressed: () {
          function();
        },
      );
    }

    Widget signup_button(String text, Color splashColor, Color highlightColor,
        Color fillColor, Color textColor, void function()) {
      return RaisedButton(
        highlightElevation: 0.0,
        splashColor: splashColor,
        highlightColor: highlightColor,
        elevation: 0.0,
        color: fillColor,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: textColor, fontSize: 20),
        ),
        onPressed: () {
          function();
        },
      );
    }

    //login and register fuctions

    void _loginUser() {
      _email = _emailController.text;
      _password = _passwordController.text;
      _emailController.clear();
      _passwordController.clear();
    }

    void _registerUser() {
      _company_name = _companyNameController.text;
      _company_type = _companyTypeController.text;
      _company_employees = _companyEmployeesController.text;
      _personName = _personNameController.text;
      _email = _emailController.text;
      _personContact = _personContactController.text;

//      _companyNameController.clear();
//      _companyTypeController.clear();
//      _companyEmployeesController.clear();
//      _personNameController.clear();
//      _emailController.clear();
//      _personContactController.clear();
      print(_companyNameController);
      networks_helper.Sign_Up(_company_name,_company_type,_company_employees,_personName, "example@mail.com",_personContact).then((response) async{
         var res = jsonDecode(response);
        if(res['error']!=true){
          print("success");
          Flushbar(
            duration: Duration(seconds: 4),
            title: "Opps", //ignored since titleText != null
            message: "error", //ignored since messageText != null
            titleText: Text("SignUp", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.yellow[600], fontFamily:"ShadowsIntoLightTwo"),),
            messageText: Text(" Congratulations!", style: TextStyle(fontSize: 16.0, color: Colors.green,fontFamily: "ShadowsIntoLightTwo"),),
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

    }

    void _loginSheet() {
      _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) {
        return DecoratedBox(
          decoration: BoxDecoration(color: Theme.of(context).canvasColor),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
            child: Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 10,
                          top: 10,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              _emailController.clear();
                              _passwordController.clear();
                            },
                            icon: Icon(
                              Icons.close,
                              size: 30.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    height: 50,
                    width: 50,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 140,
                          child: Stack(
                            children: <Widget>[
//                              Positioned(
//                                child: Align(
//                                  child: Container(
//                                    width: 130,
//                                    height: 130,
//                                    decoration: BoxDecoration(
//                                        shape: BoxShape.circle,
//                                        color: Theme.of(context).primaryColor),
//                                  ),
//                                  alignment: Alignment.center,
//                                ),
//                              ),
                              Positioned(
                                child: Container(
                                  child: Image.asset('assets/Intellogs.png',width: 340,height: 340,),
//                                  child: Text(
//                                    "LOGIN",
//                                    style: TextStyle(
//                                      fontSize: 48,
//                                      fontWeight: FontWeight.bold,
//                                      color: Colors.white,
//                                    ),
//                                  ),
                                  alignment: Alignment.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20, top: 60),
                          child: _input(FaIcon(FontAwesomeIcons.envelope,), "EMAIL",
                              _emailController, false),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: _input(FaIcon(FontAwesomeIcons.lock,), "PASSWORD",
                              _passwordController, true),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20,
                              right: 20,
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                            child: login_button("LOGIN", Colors.white, primary,
                                primary, Colors.white, _loginUser),
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height / 1.1,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
          ),
        );
      });
    }

    void _registerSheet() {
      _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) {
        return DecoratedBox(
          decoration: BoxDecoration(color: Theme.of(context).canvasColor),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0)),
            child: Container(
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 10,
                          top: 10,
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              _companyNameController.clear();
                              _companyTypeController.clear();
                              _companyEmployeesController.clear();
                              _personNameController.clear();
                              _emailController.clear();
                              _personContactController.clear();
                            },
                            icon: Icon(
                              Icons.close,
                              size: 30.0,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                    height: 50,
                    width: 50,
                  ),
                  SingleChildScrollView(
                    child: Column(children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 140,
                        child: Stack(
                          children: <Widget>[
//                            Positioned(
//                              child: Align(
//                                child: Container(
//                                  width: 130,
//                                  height: 130,
//                                  decoration: BoxDecoration(
//                                      shape: BoxShape.circle,
//                                      color: Theme.of(context).primaryColor),
//                                ),
//                                alignment: Alignment.center,
//                              ),
//                            ),
                            Positioned(
                              child: Container(
                               // padding: EdgeInsets.only(bottom: 25, right: 40),
                                child: Image.asset('assets/Intellogs.png',width: 250,height: 250,),
                                alignment: Alignment.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                          bottom: 15,
                        ),
                        child: _input
                          ( FaIcon(FontAwesomeIcons.industry,),
                            "COMPANY NAME",
                            _companyNameController,
                            false),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: _input(FaIcon(FontAwesomeIcons.question), "COMPANY TYPE",
                            _companyTypeController, true),
                      ),

                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: _input(FaIcon(FontAwesomeIcons.idCard), "PERSON NAME",
                            _personNameController, true),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: _input(FaIcon(FontAwesomeIcons.envelope), "EMAIL",
                            _emailController, true),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15),
                        child: _input(FaIcon(FontAwesomeIcons.mobile), "PERSON CONTACT",
                            _personContactController, true),
                      ),
//                    Padding(
//                      padding: EdgeInsets.only(bottom: 15),
//                      child:
//                      FlutterSlider(
//
//                        decoration: BoxDecoration(
//                          border: Border.all(color: Colors.amber.shade400),
//                          borderRadius: BorderRadius.circular(30)
//                        ),
//                        values: [300],
//                        max: 500,
//                        min: 0,
//                        onDragging: (handlerIndex, lowerValue, upperValue) {
//                          _lowerValue = lowerValue;
//                          _upperValue = upperValue;
//                          setState(() {});
//                        },
//                      )
//                    ),
//                      border: OutlineInputBorder(
//                        borderRadius: BorderRadius.circular(30),
//                        borderSide: BorderSide(
//                          color: Theme.of(context).primaryColor,
//                          width: 3,
//                        ),
//                      ),
                      Container(
                        width: 370,
                        //width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(left: 25, right: 25,),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.amber.shade400, width: 3),
                          borderRadius: BorderRadius.circular(30),
                          //color: Colors.amber.shade400
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 13),
                            ),
                            Text("COMPANY EMPLOYEES", style: TextStyle(
                              color: Colors.amber.shade400,
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(bottom: 15, top: 15),
                                child: FlutterSlider(
//                                  decoration: (
//                                  ),
//                                  decoration: BoxDecoration(
//                                      color: Colors.amber.shade400
//                                  ),
                                  values: [300],
                                  max: 500,
                                  min: 100,
                                  onDragging: (handlerIndex, lowerValue, upperValue) {
                                    _lowerValue = lowerValue;
                                    _upperValue = upperValue;
                                    setState(() {});
                                  },
                                )
//                        _input(FaIcon(FontAwesomeIcons.user), "COMPANY EMPLOYEES",
//                            _companyEmployeesController, true),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                            left: 20,
                            right: 20,
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          child: signup_button("REGISTER", Colors.white, primary,
                              primary, Colors.white, _registerUser),
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ]),
                  ),
                ],
              ),
              height: MediaQuery.of(context).size.height / 1.1,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
            ),
          ),
        );
      });
    }

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        key: _scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            logo(),
            Padding(
              child: Container(
                child: login_button("LOGIN", primary, Colors.white, Colors.white,
                    primary, _loginSheet),
                height: 50,
              ),
              padding: EdgeInsets.only(top: 80, left: 20, right: 20),
            ),
            Padding(
              child: Container(
                child: OutlineButton(
                  highlightedBorderColor: Colors.white,
                  borderSide: BorderSide(color: Colors.white, width: 2.0),
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
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  onPressed: () {
                    _registerSheet();
                  },
                ),
                height: 50,
              ),
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15,)
                ),
                InkWell(
                  onTap: (){},
                  child: Text("Forgot password?", style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    //decoration: TextDecoration.underline
                  ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                child: ClipPath(
                  child: Container(
                    color: Colors.white,
                    height: 300,
                  ),
                  clipper: BottomWaveClipper(),
                ),
                alignment: Alignment.bottomCenter,
              ),
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.stretch,
        ));
  }
}

import 'package:custom_switch_button/custom_switch_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class EditAssetGroup extends StatefulWidget{
  String token;
  var specificAssetGroup;

  EditAssetGroup(this.token, this.specificAssetGroup);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EditAssetGroup_State(token,specificAssetGroup);
  }

}

class _EditAssetGroup_State extends State<EditAssetGroup>{
  String token;
  var specificAssetGroup;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey();
  TextEditingController title, description;
  var assetGroupResponse;
  List<String> parentGroup=[], type=[], associatedDepartment=[], departmentSection=[] ;
  String selectedParentGroup, selectedType, selectedAssociatedDepartment, selectedDepartmentSection;
  int parentGroup_id, type_id, associatedDepartment_id, departmentSection_id;
  bool isChecked = false;

  _EditAssetGroup_State(this.token, this.specificAssetGroup);

  void initState() {
    // TODO: implement initState
    super.initState();
    title = TextEditingController();
    description = TextEditingController();
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
//        fontFamily: 'Montserrat'
        title: Text("Add Asset Group",style: TextStyle(color: Colors.white,),),
        iconTheme: IconThemeData(color: Colors.white,),
        backgroundColor: Colors.amber.shade400,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(8),
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
                    controller: title,
                    attribute: "Title",
                    //keyboardType: TextInputType.emailAddress,
                    validators: [FormBuilderValidators.required()],
                    decoration: InputDecoration(labelText: "TITLE GROUP", labelStyle: TextStyle(
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
                  padding: EdgeInsets.all(8),
                  child: FormBuilderDropdown(
                    //initialValue: specificDepartment['managers_list']!=null?specificDepartment['managers_list'].toString():"",
                    attribute: "Parent Group",
                    validators: [FormBuilderValidators.required()],
                    hint: Text("- Select - ",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold)),
                    items: parentGroup.map((name) => DropdownMenuItem(
                        value: name,
                        child: Text("$name",textScaleFactor:1.0,style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),)))
                        .toList(),
                    onChanged: (value){
                      setState(() {
                        selectedParentGroup = value;
                        parentGroup_id = parentGroup.indexOf(value);
                      });
                    },
                    onSaved: (value){
                      setState(() {
                        selectedParentGroup = value;
                        parentGroup_id = parentGroup.indexOf(value);
                        print(selectedParentGroup);
                      });
                    },
                    style: Theme.of(context).textTheme.bodyText2,
                    decoration: InputDecoration(labelText: "PARENT GROUP", labelStyle: TextStyle(
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
                    //initialValue: specificDepartment['managers_list']!=null?specificDepartment['managers_list'].toString():"",
                    attribute: "Type",
                    validators: [FormBuilderValidators.required()],
                    hint: Text("- Select - ",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold)),
                    items: type.map((name) => DropdownMenuItem(
                        value: name,
                        child: Text("$name",textScaleFactor:1.0,style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),)))
                        .toList(),
                    onChanged: (value){
                      setState(() {
                        selectedType = value;
                        type_id = type.indexOf(value);
                      });
                    },
                    onSaved: (value){
                      setState(() {
                        selectedType = value;
                        type_id = type.indexOf(value);
                        print(selectedType);
                      });
                    },
                    style: Theme.of(context).textTheme.bodyText2,
                    decoration: InputDecoration(labelText: "TYPE", labelStyle: TextStyle(
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
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("Status", style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 1, right: 1),
                            ),
                            Text("ON: ", style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 1, right: 1),
                            ),
                            Text("Active", style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          child: CustomSwitchButton(
                            backgroundColor: Colors.grey[400],
                            unCheckedColor: Colors.white,
                            animationDuration: Duration(milliseconds: 200),
                            checkedColor: Colors.green,
                            checked: isChecked,
                          ),
                        ),
                      ],
                    )
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: FormBuilderDropdown(
                    //initialValue: specificDepartment['managers_list']!=null?specificDepartment['managers_list'].toString():"",
                    attribute: "Associated Department",
                    validators: [FormBuilderValidators.required()],
                    hint: Text("- Select - ",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold)),
                    items: associatedDepartment.map((name) => DropdownMenuItem(
                        value: name,
                        child: Text("$name",textScaleFactor:1.0,style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),)))
                        .toList(),
                    onChanged: (value){
                      setState(() {
                        selectedAssociatedDepartment = value;
                        associatedDepartment_id = associatedDepartment.indexOf(value);
                      });
                    },
                    onSaved: (value){
                      setState(() {
                        selectedAssociatedDepartment = value;
                        associatedDepartment_id = associatedDepartment.indexOf(value);
                        print(selectedAssociatedDepartment);
                      });
                    },
                    style: Theme.of(context).textTheme.bodyText2,
                    decoration: InputDecoration(labelText: "ASSOCIATED DEPARTMENT", labelStyle: TextStyle(
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
                    //initialValue: specificDepartment['managers_list']!=null?specificDepartment['managers_list'].toString():"",
                    attribute: "Department Section",
                    validators: [FormBuilderValidators.required()],
                    hint: Text("- Select - ",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold)),
                    items: departmentSection.map((name) => DropdownMenuItem(
                        value: name,
                        child: Text("$name",textScaleFactor:1.0,style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),)))
                        .toList(),
                    onChanged: (value){
                      setState(() {
                        selectedDepartmentSection = value;
                        departmentSection_id = departmentSection.indexOf(value);
                      });
                    },
                    onSaved: (value){
                      setState(() {
                        selectedDepartmentSection = value;
                        departmentSection_id = departmentSection.indexOf(value);
                        print(selectedDepartmentSection);
                      });
                    },
                    style: Theme.of(context).textTheme.bodyText2,
                    decoration: InputDecoration(labelText: "DEPARTMENT SECTION", labelStyle: TextStyle(
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
                      splashColor: Colors.amber.shade400,
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
//                        networks_helper.addDepartment(token, deparment_name.text, description.text,selected_manager).then((value){
//                          var res = jsonDecode(value);
//                          if(res['error']== false){
//                            flushBar().flushbar("Add Department", res['message'], 3, context);
//                            Navigator.pop(context);
//                          }
//                          else {
//                            flushBar().flushbar("Add Department", res['message'], 3, context);
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
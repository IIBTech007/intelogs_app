import 'dart:convert';
import 'package:http/http.dart' as http;

class networks_helper{
   var url = "http://192.236.147.77:8082/Intelogs/";
  static Future<String> Sign_In(String email,String password) async{
    Map<String,String> headers = {};
    var map = new Map<String, dynamic>();
    map['person_email'] = email;
    map['password'] = password;
   // final body = jsonEncode({"email":email,"password":password});
    final response = await http.post('http://192.236.147.77:8082/Intelogs/registration/?op=company_signin',
      headers: headers,
      body: map,
    );
    print(response.body);
    if(response.statusCode==200) {
      return response.body;
    }else
      return null;
  }
  static Future<String> Sign_Up(String company_name,String company_type,String NoOfEmployee
      ,String person_name,String person_email,String person_contact) async{
    Map<String,String> headers = {};
    var map = new Map<String, dynamic>();
    map['company_name'] = company_name;
    map['company_type'] = company_type;
    map['company_employees'] = NoOfEmployee;
    map['person_name'] = person_name;
    map['person_email'] = person_email;
    map['person_contact'] = person_contact;
    final body = jsonEncode({"company_name":company_name,"company_type":company_type,
      "company_employees":NoOfEmployee,"person_name":person_name,"person_email":person_email,"person_contact":person_contact});
    final response = await http.post('http://192.236.147.77:8082/Intelogs/registration/?op=company_registration',
      headers: headers,
      body: map,
    );
    print(response.body);
    if(response.statusCode==200) {
      return response.body;
    }else
      return null;
  }
  static Future<String> Forgot_Password(String email) async{
    Map<String,String> headers = {};
    var map = new Map<String, dynamic>();
    map['recover_email'] = email;
   // final body = jsonEncode({"email":email});
    final response = await http.post('http://192.236.147.77:8083/api/Account/ForgotPassword',
      headers: headers,
      body: map,
    );
    print(response.body);
    if(response.statusCode==200) {
      return response.body;
    }else
      return null;
  }
  static Future<String> Reset_Password(String email,String token,String password) async{
    Map<String,String> headers = {'Content-Type':'application/json'};
    final body = jsonEncode({"email":email,"password":password,"token":token,"confirmPassword":password});
    final response = await http.post('http://192.236.147.77:8083/api/Account/ResetPassword',
      headers: headers,
      body: body,
    );
    print(response.body);
    if(response.statusCode==300) {
      return response.body;
    }else
      return null;
  }

}
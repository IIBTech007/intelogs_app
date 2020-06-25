import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';


class networks_helper{
   static const BaseUrl = "http://192.236.147.77:8082/Intelogs/";

//  static postData(Map<String, dynamic> body,String url)async{
//     var dio = Dio();
//
//     try {
//      // body.putIfAbsent("person_email","waqar@gmail.com",);
//       FormData formData = new FormData.fromMap(body);
//       var response = await dio.post(url, data: formData);
//       return response.data;
//     } catch (e) {
//       print(e);
//     }
//   }
//    getHttp(String url) async {
//     try {
//       Response response = await Dio().get(url);
//       print(response);
//       if(response.statusCode == 200)
//       return response.data;
//       else {
//        return null;
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//


   static Future<String> Sign_In(String email,String password) async{
     String url = BaseUrl + 'registration/?op=company_signin';
     try {
     var dio = Dio();
     FormData formData = new FormData.fromMap({
       'person_email': email,
       'password': password,
     });
     var responsedio = await dio.post(url, data: formData,);
//    Map<String,String> headers = {};
//    var map = new Map<String, dynamic>();
//    map['person_email'] = email;
//    map['password'] = password;
//     postData(map, url);
//    final body = jsonEncode({"email":email,"password":password});
//    final response = await http.post(BaseUrl+'registration/?op=company_signin',
//      headers: headers,
//      body: map,
//    );
//    print(response.body);
     if (responsedio.statusCode == 200) {
       return responsedio.data;
     } else
       return null;
   }catch (e) {
     print(e);
   }

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
    final response = await http.post(BaseUrl+'registration/?op=company_registration',
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

   static Future<String> skillsGroup(String token) async{

   String url = BaseUrl+'index.php/structure/?auth='+token+'&op=get_all_skill_groups';
     try {
       Response responseDio = await Dio().get(url,);
       print(responseDio);
       print("object");
       if(responseDio.statusCode== 200) {
        return responseDio.data;
       }
       else{
         return null;
       }
     } catch (e) {
       print(e);
     }
//     Map<String,String> headers = {};
////     'Authorization':'Bearer '+token
//     final response = await http.get(BaseUrl+'index.php/structure/?auth='+token+'&op=get_all_skill_groups',
//       headers: headers,
//     );
//     if(response.statusCode==200){
//       return response.body;
//     }else
//       return null;

   }


   static Future<String> deleteSkillsGroup(String token,String id) async{
     Map<String,String> headers = {};
     var map = new Map<String, dynamic>();
     map['skill_group_id'] = id;
     final response = await http.post(BaseUrl+'index.php/structure/?auth='+token+'&op=delete_skill_group',
       body: map,
       headers: headers,
     );
     if(response.statusCode==200){
       return response.body;
     }else
       return null;
   }
   static Future<String> editSkillsGroup(String token,String id,String name,String description) async{
     String url = BaseUrl+'index.php/structure/?auth='+token+'&op=edit_skill_group';
     try {
       var dio = Dio();
       FormData formData = new FormData.fromMap({
         'skill_group_id': id,
         'skill_group_name': name,
         'skill_group_description': description,
       });
       var responsedio = await dio.post(url, data: formData,);
       if (responsedio.statusCode == 200) {
         return responsedio.data;
       } else
         return null;
     }catch (e) {
       print(e);
     }
//     Map<String,String> headers = {};
//     var map = new Map<String, dynamic>();
//     map['skill_group_id'] = id;
//     map['skill_group_name'] = name;
//     map['skill_group_description'] = description;
//     final response = await http.post(BaseUrl+'index.php/structure/?auth='+token+'&op=edit_skill_group',
//       body: map,
//       headers: headers,
//     );
//     if(response.statusCode==200){
//       return response.body;
//     }else
//       return null;

   }

}
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';


class sections_network{
  static const BaseUrl = "http://192.236.147.77:8082/Intelogs/";

  static Future<String> specificSection(String token,String id) async{
    String url = BaseUrl+'index.php/structure/?auth='+token+'&op=single-section';
    try {
      var dio = Dio();
      FormData formData = new FormData.fromMap({
        'section_id': id,
      });
      var responsedio = await dio.post(url, data: formData,);
      return responsedio.data;
      if (responsedio.statusCode == 200) {
        return responsedio.data;
      } else
        return null;
    }catch (e) {
      print(e);
    }
  }

  static Future<String> editSection(String token,String id,String name,String section_incharge,String shift_category) async{
    String url = BaseUrl+'index.php/structure/?auth='+token+'&op=editSection';
    try {
      var dio = Dio();
      FormData formData = new FormData.fromMap({
        'section_id': id,
        'section_name': name,
        'section_incharge': section_incharge,
        'shift_category':shift_category,
      });
      var responsedio = await dio.post(url, data: formData,);
      return responsedio.data;
      if (responsedio.statusCode == 200) {

      } else
        return null;
    }catch (e) {
      print(e);
    }
  }




}
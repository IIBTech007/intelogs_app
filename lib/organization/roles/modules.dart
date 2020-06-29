
import 'package:intelogsapp/organization/roles/permission.dart';

class modules{
  String id,pid;
  bool select;
  List<permission> permissions;

  modules({this.id, this.pid, this.select, this.permissions});
  Map<String,dynamic> toJson(){
  var map = Map<String,dynamic>();
  map['id']=id;
  map['pid']=pid;
  map['select']=select;
  map['permissions']=permissions;
  return map;
  }
}
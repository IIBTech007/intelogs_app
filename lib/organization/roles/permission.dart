class permission {
  String name;
  bool select;

  permission({this.name, this.select});

  Map<String,dynamic> toJson(){
    var map = Map<String,dynamic>();
    map['name']=name;
    map['select']=select;
    return map;
  }
}
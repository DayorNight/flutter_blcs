import 'package:shared_preferences/shared_preferences.dart';
/// sp封装
class Sp {
  /// 通用设置持久化数据
  static save<T>(String key, T value) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String type = value.runtimeType.toString();
    switch (type) {
      case "String":
        sp.setString(key, value as String);
        break;
      case "int":
        sp.setInt(key, value as int);
        break;
      case "bool":
        sp.setBool(key, value as bool);
        break;
      case "double":
        sp.setDouble(key, value as double);
        break;
      case "List<String>":
        sp.setStringList(key, value as List<String>);
        break;
    }
  }

  /// 获取持久化数据
  static Future<T?> get<T>(String key) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    var object = sp.get(key);
    return object == null? null:object as T;
  }
  ///删除数据
  static clear(String key) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    if(sp.containsKey(key)){
      sp.remove(key);
    }
  }

  ///删除所有数据
  static clearAll() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    Set<String> keys = sp.getKeys();
    for(String key in keys){
      sp.remove(key);
    }
  }
}
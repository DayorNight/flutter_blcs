import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';

class HiveUtils {
  HiveUtils._internal();

  static final HiveUtils _hiveUtils = HiveUtils._internal();

  factory HiveUtils() {
    return _hiveUtils;
  }

  ///初始化，必须要初始化
  /// await HiveUtils().init();
  Future init() async {
    var path = Directory.systemTemp.path;
    await Hive.initFlutter(path);
  }
  ///HiveUtils.put('person', person, boxName: 'settings',adapter: PersonAdapter());
  ///adapter生成 : Terminal ->  flutter packages pub run build_runner build
  static void put<T>(String key,T value,{required String boxName,TypeAdapter? adapter}) async{
    if(adapter != null){
      Hive.registerAdapter(adapter);
    }
    var box = await Hive.openBox<T>(boxName);
    await box.put(key, value);
    box.close();
  }
  ///var future = await HiveUtils.get<Person>('person', boxName: "settings");
  static Future<T?> get<T>(String key,{required String boxName}) async {
    var box = await Hive.openBox<T>(boxName);
    return box.get(key);
  }

}
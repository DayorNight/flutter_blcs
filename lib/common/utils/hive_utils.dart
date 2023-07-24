import 'dart:convert';
import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HiveUtils {
  HiveUtils._internal();

  static HiveUtils _hiveUtils = HiveUtils._internal();
  static const Box = 'box_name';

  factory HiveUtils() {
    return _hiveUtils;
  }

  //初始化，必须要初始化
  void init() async {
    var path = Directory.current.path;
    await Hive.initFlutter();
    // Hive.registerAdapter(PersonAdapter());
  }

  static void put<T>(String key, T value) async{
    var box = await Hive.openBox<T>(Box);
    await box.put(key, value);
  }

  static Future<T?> get<T>(String key) async{
    var box = await Hive.openBox<T>(Box);
    return box.get(key);
  }


}
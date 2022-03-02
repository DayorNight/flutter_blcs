
// 提供五套可选主题色
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/CacheObject.dart';
import 'package:flutter_blcs/models/cacheConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/profile.dart';
import 'Git.dart';

const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

///管理APP的全局变量
class Global{
  static late SharedPreferences  _prefs;
  // 用户信息
  static Profile profile = Profile();
  // 网络缓存对象
  static NetCache netCache = NetCache();

  //可选的主题列表
  static List<MaterialColor> get themes => _themes;

  //是否为release版
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _prefs = await SharedPreferences.getInstance();
    var _profile = _prefs.getString("profile");
    if(_profile != null){
      try{
        profile = Profile.fromJson(jsonDecode(_profile));
      } catch (e){
        print(e);
      }
    }else{
      //默认主题索引位0，代表蓝色
      profile = Profile()..theme = 0;
    }

    //如果没有缓存策略，设置默认缓存策略
    profile.cache = profile.cache ?? CacheConfig()
      ..enable = true
      ..maxAge = 3600
      ..maxCount = 100;

    //初始化网络请求相关配置
    Git.init();
  }

  //持久化profile信息
  static saveProfile() => _prefs.setString("profile", jsonDecode(profile.toJson()));
}




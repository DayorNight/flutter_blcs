import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_blcs/bean/json_mul_demo.dart';
import 'package:flutter_blcs/generated/assets.dart';
import '../bean/json_demo.dart';

Future<JsonDemo> getJsonDemo() async{
  // 读取JSON文件
  String jsonStr = await rootBundle.loadString(Assets.jsonsJsonDemo);
  // 转化为model
  JsonDemo json = jsonDemoFromJson(jsonStr);
  return json;
}

Future<List<JsonDemo>> getJsonListDemo() async{
  String jsonStr = await rootBundle.loadString(Assets.jsonsJsonListDemo);
  List<dynamic> list = json.decode(jsonStr);
  List<JsonDemo> demos = list.map((e) => JsonDemo.fromJson(e)).toList();
  return demos;
}

Future<JsonMulDemo> getJsonMulDemo() async{
  String jsonStr = await rootBundle.loadString(Assets.jsonsJsonMulDemo);
  JsonMulDemo jsonMulDemo = jsonMulDemoFromJson(jsonStr);
  return jsonMulDemo;
}
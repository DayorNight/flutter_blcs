import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_blcs/bean/json_mul_demo.dart';
import '../bean/json_demo.dart';
import '../common/static.dart';

Future<JsonDemo> getJsonDemo() async{
  // 读取JSON文件
  String jsonStr = await rootBundle.loadString(Json.jsonDemo);
  // 转化为model
  JsonDemo json = jsonDemoFromJson(jsonStr);
  return json;
}

Future<List<JsonDemo>> getJsonListDemo() async{
  String jsonStr = await rootBundle.loadString(Json.jsonListDemo);
  List<dynamic> list = json.decode(jsonStr);
  List<JsonDemo> demos = list.map((e) => JsonDemo.fromJson(e)).toList();
  return demos;
}

Future<JsonMulDemo> getJsonMulDemo() async{
  String jsonStr = await rootBundle.loadString(Json.jsonMulDemo);
  JsonMulDemo jsonMulDemo = jsonMulDemoFromJson(jsonStr);
  return jsonMulDemo;
}
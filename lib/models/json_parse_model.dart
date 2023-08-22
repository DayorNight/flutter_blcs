import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_blcs/bean/json_mul_demo.dart';
import 'package:flutter_blcs/bean/json_object_entity.dart';
import 'package:flutter_blcs/common/extension/parse_extension.dart';
import 'package:flutter_blcs/generated/assets.dart';
import 'package:flutter_blcs/generated/json/base/json_convert_content.dart';
import '../bean/json_demo.dart';
import '../common/extension/base_response_entity.dart';

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

Future<JsonObjectEntity> getJsonObject() async{
  String jsonStr = await rootBundle.loadString(Assets.jsonsJsonObject);
  final res = json.decode(jsonStr);
  BaseResponseEntity<JsonObjectEntity> baseResEntity = BaseResponseEntity(
      data: res['data'],
      code: res['code'],
      msg: res['msg'],
      timeStamp: res['timeStamp']
  );
  return Future.value(baseResEntity).check();
}
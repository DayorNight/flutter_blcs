import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_blcs/bean/knowledge.dart';
import 'package:flutter_blcs/common/static.dart';
import 'package:flutter_blcs/common/utils/print.dart';

Future<List<Knowledge>> getBasicKnowledgeData() async {
    // 读取JSON文件
    String jsonStr = await rootBundle.loadString(Json.knowledge);
    //转成list
    List<dynamic> list= json.decode(jsonStr);
    //转成Knowledge list
    List<Knowledge> map = list.map((e) => Knowledge.fromJson(e)).toList();
    return map;
  }



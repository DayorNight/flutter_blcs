import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_blcs/bean/knowledge.dart';
import 'package:flutter_blcs/generated/assets.dart';

Future<List<Knowledge>> getBasicKnowledgeData() async {
    // 读取JSON文件
    String jsonStr = await rootBundle.loadString(Assets.jsonsBasicKnowledge);
    //转成list
    List<dynamic> list= json.decode(jsonStr);
    //转成Knowledge list
    List<Knowledge> map = list.map((e) => Knowledge.fromJson(e)).toList();
    return map;
  }



import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blcs/bean/json_demo.dart';
import 'package:flutter_blcs/common/static.dart';
import 'package:flutter_blcs/common/utils/print.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/widgets/article_model.dart';
import '../../common/utils/code.dart';

class IsolatePage extends StatelessWidget {
  static final String keys = "IsolatePage";
  static const String jsonStr = ''' {
    "name": "玉米",
    "age": 18,
    "sex": false
    }
  ''';
  const IsolatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder: builder,
      future: _parseInBackground(),);
  }

  Widget builder(BuildContext context,
      AsyncSnapshot<JsonDemo> snapshot) {
    return ArticleModel(title: S
        .of(context)
        .isolate,
        keys: keys,
        logoColor: Theme
            .of(context)
            .primaryColor,
        des: isolateDes,
        code: isolateCode,
        headerChild:snapshot.hasData?Text(jsonDemoToJson(snapshot.data as JsonDemo)):CircularProgressIndicator(),);
  }

  Future<JsonDemo> _parseInBackground() async {
    //接收端口
    final p = ReceivePort();
    //生成并启动一个在后台运行的 isolate 工作对象
    await Isolate.spawn(_readAndParseJson, p.sendPort);
    return await p.first as JsonDemo;
  }

  Future<void> _readAndParseJson(SendPort p) async {
    // 转化为model
    JsonDemo json = jsonDemoFromJson(jsonStr);
    // 退出isolate
    Isolate.exit(p, json);
  }

}



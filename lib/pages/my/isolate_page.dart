import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/bean/json_demo.dart';
import 'package:flutter_blcs/common/base_page_state_widget.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import '../../common/utils/code.dart';

class IsolatePage extends BasePageStateWidget {
  static final String keys = "IsolatePage";

  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => S.current.isolate;

  @override
  String? get getDes => isolateDes;

  @override
  String? get getCode => isolateCode;

  static const String jsonStr = ''' {
    "name": "玉米",
    "age": 18,
    "sex": false
    }
  ''';

  @override
  Widget? buildBody(BuildContext context) {
    return FutureBuilder(
      builder: (ctx, snapshot) {
        return snapshot.hasData
            ? Text(jsonDemoToJson(snapshot.data as JsonDemo))
            : CircularProgressIndicator();
      },
      future: _parseInBackground(),
    );
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

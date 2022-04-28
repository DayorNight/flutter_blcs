import 'dart:convert';

import 'package:flutter_blcs/bean/json_demo.dart';

/// code : 200
/// data : [{"name":"玉米","age":18,"sex":false},{"name":"张三","age":19,"sex":false},{"name":"李四","age":20,"sex":false}]

JsonMulDemo jsonMulDemoFromJson(String str) =>
    JsonMulDemo.fromJson(json.decode(str));

String jsonMulDemoToJson(JsonMulDemo data) => json.encode(data.toJson());

class JsonMulDemo {
  JsonMulDemo({
    int? code,
    List<JsonDemo>? data,
  }) {
    _code = code;
    _data = data;
  }

  JsonMulDemo.fromJson(dynamic json) {
    _code = json['code'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(JsonDemo.fromJson(v));
      });
    }
  }

  int? _code;
  List<JsonDemo>? _data;

  int? get code => _code;

  List<JsonDemo>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

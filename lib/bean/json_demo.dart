import 'dart:convert';

/// name : "玉米"
/// age : 18
/// sex : false

JsonDemo jsonDemoFromJson(String str) => JsonDemo.fromJson(json.decode(str));

String jsonDemoToJson(JsonDemo data) => json.encode(data.toJson());

class JsonDemo {
  JsonDemo({
    String? name,
    int? age,
    bool? sex,
  }) {
    _name = name;
    _age = age;
    _sex = sex;
  }

  JsonDemo.fromJson(dynamic json) {
    _name = json['name'];
    _age = json['age'];
    _sex = json['sex'];
  }

  String? _name;
  int? _age;
  bool? _sex;

  String? get name => _name;

  int? get age => _age;

  bool? get sex => _sex;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['age'] = _age;
    map['sex'] = _sex;
    return map;
  }
}

/// data : "T"
/// code : 10000
/// msg : "msg"
/// timeStamp : "timeStamp"

class BaseResponseEntity<T> {
  dynamic data;
  late int code;
  late String msg;
  late num timeStamp;

  BaseResponseEntity({this.data, required this.code, required this.msg, required this.timeStamp});

  BaseResponseEntity.fromJson(dynamic json) {
    data = json["data"];
    code = json["code"];
    msg = json["msg"];
    timeStamp = json["timeStamp"];
  }

  bool isResponse() {
    return code == 10000;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["data"] = data;
    map["code"] = code;
    map["msg"] = msg;
    map["timeStamp"] = timeStamp;
    return map;
  }
}

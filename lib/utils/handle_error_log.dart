import 'dart:async';
import 'package:flutter/material.dart';

///处理flutter为我们捕获的异常
void handleError(){
  var onError = FlutterError.onError; //先将 onerror 保存起来
  FlutterError.onError = (FlutterErrorDetails details) {
    onError?.call(details); //调用默认的onError
    reportErrorAndLog(details); //上报
  };
}

///异步错误处理
ZoneSpecification getZoneSpecification() {
  return ZoneSpecification(
    print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
      collectLog(line);
      parent.print(zone, "print: ==========: $line");
    },
    // 拦截未处理的异步错误
    handleUncaughtError: (Zone self, ZoneDelegate parent, Zone zone,
        Object error, StackTrace stackTrace) {
      var details = makeDetails(error, stackTrace);
      reportErrorAndLog(details);
      parent.print(zone, '========== ${error.toString()} $stackTrace');
    },
  );
}

/// 构建错误信息
FlutterErrorDetails makeDetails(Object obj, StackTrace stack){
  return FlutterErrorDetails(exception: obj);
}

///收集日志
void collectLog(String line){

}
///上报错误和日志逻辑
void reportErrorAndLog(FlutterErrorDetails details){
  print("异常上报： $details");
}

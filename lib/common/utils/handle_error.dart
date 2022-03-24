import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/utils/print.dart';

class HandleError{
  ///处理flutter为我们捕获的异常
  static void handleUIError(){
    var onError = FlutterError.onError; //先将 onerror 保存起来
    FlutterError.onError = (FlutterErrorDetails details) {
      onError?.call(details); //调用默认的onError
      reportErrorAndLog(details); //上报
    };
  }

  ///异步错误处理
  static ZoneSpecification getZoneSpecification() {
    return ZoneSpecification(
      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
        /*"收集日志*/
        parent.print(zone,line);
      },
      // 拦截未处理的异步错误
      handleUncaughtError: (Zone self, ZoneDelegate parent, Zone zone,
          Object error, StackTrace stackTrace) {
        println.e("================异步处理===================");
        reportErrorAndLog(FlutterErrorDetails(exception: error));
      },
    );
  }

  ///上报错误和日志逻辑
  static  void reportErrorAndLog(FlutterErrorDetails details){
    println.e("================异常上报===================\n $details");
    println.e("================上报结束===================");
  }
}
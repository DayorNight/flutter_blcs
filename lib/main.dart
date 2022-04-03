import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blcs/app.dart';
import 'package:flutter_blcs/common/utils/print.dart';
import 'package:flutter_blcs/pages/error_page.dart';
import 'package:flutter_blcs/viewmodel/providers.dart';
import 'package:provider/provider.dart';

void main() async {

  runZonedGuarded((){
    ///异常捕获
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      println.e('error1: $details');
      return ErrorPage(
          details.exception.toString() + "\n " + details.stack.toString(), details);
    };

    var onError = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails details) {
      onError?.call(details);
      println.e('error2: $details');
    };
    // HandleError.handleUIError();
    runApp(MultiProvider(
      providers: providerDatas,
      child: MyApp(),
    ));
  }, (Object error, StackTrace stack){
    println.e('error3: $error \nstack: $stack');
  });
}


// void main() async {
//   ///处理flutter为我们捕获的异常
//   HandleError.handleUIError();
//   ///初始化程序
//   runZoned(
//           () => runApp(MultiProvider(
//         providers:providerDatas,
//         child: MyApp(),
//       )),
//       zoneSpecification: HandleError.getZoneSpecification()
//   );
// }

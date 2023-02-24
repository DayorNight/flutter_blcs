import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blcs/app.dart';
import 'package:flutter_blcs/common/utils/print.dart';
import 'package:flutter_blcs/debugTool/custom_ume_widget.dart';
import 'package:flutter_blcs/pages/error_page.dart';
import 'package:flutter_blcs/viewmodel/providers.dart';
import 'package:provider/provider.dart';


void main() async {

  runZonedGuarded((){
    ///异常捕获
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      println.e('Handles uncaught asynchronous errors: $details');
      return ErrorPage(
          details.exception.toString() + "\n " + details.stack.toString(), details);
    };

    var onError = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails details) {
      onError?.call(details);
      println.w('Flutter framework error: $details');
    };

    runApp(CustomUmeWidget(child: runProviderApp()));
  }, (Object error, StackTrace stack){
    println.e('runZonedGuarded: $error \nstack: $stack');
  });
}

Widget runProviderApp(){
  return MultiProvider(
    providers: providerDatas,
    child: MyApp(),
  );
}

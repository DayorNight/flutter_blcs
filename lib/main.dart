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
      return ErrorPage(
          details.exception.toString() + "\n " + details.stack.toString(), details);
    };
    runApp(MultiProvider(
      providers: providerDatas,
      child: MyApp(),
    ));
  }, (Object error, StackTrace stack){
    println.e('error: $error \nstack: $stack');
  });
}



import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/app.dart';
import 'package:flutter_blcs/utils/code.dart';
import 'package:flutter_blcs/utils/handle_error_log.dart';
import 'package:flutter_blcs/viewmodel/language_viewmodel.dart';
import 'package:flutter_blcs/viewmodel/login_viewmodel.dart';
import 'package:flutter_blcs/viewmodel/providers.dart';
import 'package:flutter_blcs/viewmodel/theme_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  ///处理flutter为我们捕获的异常
  handleError();
  ///初始化程序
  runZoned(
      () => runApp(MultiProvider(
            providers:providerDatas,
            child: MyApp(),
          )),
      zoneSpecification: getZoneSpecification()
  );
}


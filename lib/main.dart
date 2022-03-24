import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blcs/app.dart';
import 'package:flutter_blcs/common/utils/handle_error.dart';
import 'package:flutter_blcs/viewmodel/providers.dart';
import 'package:provider/provider.dart';

void main() async {
  ///处理flutter为我们捕获的异常
  HandleError.handleUIError();
  ///初始化程序
  runZoned(
      () => runApp(MultiProvider(
            providers:providerDatas,
            child: MyApp(),
          )),
      zoneSpecification: HandleError.getZoneSpecification()
  );
}


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blcs/app.dart';
import 'package:flutter_blcs/common/utils/print.dart';
import 'package:flutter_blcs/config/config.dart';
import 'package:flutter_blcs/pages/error_page.dart';
import 'package:flutter_blcs/viewmodel/providers.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ume/flutter_ume.dart'; // UME 框架
import 'package:flutter_ume_kit_console/flutter_ume_kit_console.dart';
import 'package:flutter_ume_kit_ui/flutter_ume_kit_ui.dart'; // UI 插件包
import 'package:flutter_ume_kit_perf/flutter_ume_kit_perf.dart'; // 性能插件包
import 'package:flutter_ume_kit_show_code/flutter_ume_kit_show_code.dart'; // 代码查看插件包
import 'package:flutter_ume_kit_device/flutter_ume_kit_device.dart'; // 设备信息插件包
import 'package:flutter_ume_kit_console/flutter_ume_kit_console.dart'; // debugPrint 插件包
import 'package:flutter_ume_kit_dio/flutter_ume_kit_dio.dart'; // Dio 网络请求调试工具
import 'package:dio/dio.dart';

import 'http/global.dart';

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
      println.w('error2: $details');
    };

    // UME
    runUME();

  }, (Object error, StackTrace stack){
    println.e('error3: $error \nstack: $stack');
  });
}

void runUME(){
  if (Config.DEBUG) {
    PluginManager.instance                                 // 注册插件
      ..register(WidgetInfoInspector())                    // Widget信息
      ..register(WidgetDetailInspector())                  // Widget详情
      ..register(AlignRuler())                             // 对齐标尺
      ..register(ColorPicker())                            // 颜色吸管
      ..register(TouchIndicator())                         // 触摸标志
      ..register(Performance())                            // 性能
      ..register(ShowCode())                               // 显示代码
      ..register(MemoryInfoPage())                         // 内存信息
      ..register(CpuInfoPage())                            // CPU信息
      ..register(DeviceInfoPanel())                        // 设备信息
      ..register(Console())                                // 日志
      ..register(DioInspector(dio: Global.getInstance().dio));    // 传入你的 Dio 实例
    runApp(UMEWidget(child: runProvider(), enable: true,)); // 初始化
  } else {
    runApp(runProvider());
  }
}

Widget runProvider(){
  return MultiProvider(
    providers: providerDatas,
    child: MyApp(),
  );
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

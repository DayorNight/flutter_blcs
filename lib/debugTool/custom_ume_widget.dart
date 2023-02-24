import 'package:flutter/material.dart';

import '../config/config.dart';
import '../http/dio_helper.dart';
import '../main.dart';
import 'package:flutter_ume/flutter_ume.dart'; // UME 框架
import 'package:flutter_ume_kit_console/flutter_ume_kit_console.dart';
import 'package:flutter_ume_kit_device/flutter_ume_kit_device.dart'; // 设备信息插件包
import 'package:flutter_ume_kit_dio/flutter_ume_kit_dio.dart'; // Dio 网络请求调试工具
import 'package:flutter_ume_kit_perf/flutter_ume_kit_perf.dart'; // 性能插件包
import 'package:flutter_ume_kit_show_code/flutter_ume_kit_show_code.dart'; // 代码查看插件包
import 'package:flutter_ume_kit_ui/flutter_ume_kit_ui.dart'; // UI 插件包

/// Flutter 应用内调试工具平台
/// https://pub.dev/packages/flutter_ume
class CustomUmeWidget extends StatelessWidget {
  final Widget child;
  const CustomUmeWidget({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        ..register(DioInspector(dio: DioHelper.getInstance().http));    // 传入你的 Dio 实例
    }
    return Config.DEBUG? UMEWidget(child: runProviderApp(), enable: true) : runProviderApp();
  }
}

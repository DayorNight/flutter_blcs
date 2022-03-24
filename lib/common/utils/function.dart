

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 双击返回
DateTime? _lastPressedAt; //上次点击时间
bool isDoubleClick(){
  if (_lastPressedAt == null ||
      DateTime.now().difference(_lastPressedAt!) >
          Duration(seconds: 1)) {
    //两次点击间隔超过1秒则重新计时
    _lastPressedAt = DateTime.now();
    return false;
  }
  return true;
}

/// 屏幕适配
void screenInit(BuildContext context){
  ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: Size(750, 1334),
      context: context,
      minTextAdapt: true,
      orientation: Orientation.portrait);
}


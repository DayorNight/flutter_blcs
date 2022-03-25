import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/sp/sp.dart';
import 'package:flutter_blcs/common/theme_colors.dart';
import 'package:flutter_blcs/common/sp/sp_keys.dart';
import 'package:flutter_blcs/common/utils/print.dart';
///切换主题通知
class ThemeViewModel extends ChangeNotifier{
  int _color =0;
  ThemeMode _themeMode = ThemeMode.light;
  int get getColor{
    return _color;
  }
  ///设置主题颜色序号
  void setColor(int color){
    if(color > themes.length -1) return;
    _color = color;
    notifyListeners();
  }

  ThemeMode get getThemeMode{
    return _themeMode;
  }
  ///设置主题模式
  void  setMode(ThemeMode mode){
    _themeMode = mode;
    notifyListeners();
  }


}

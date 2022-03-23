import 'package:flutter/material.dart';
import 'package:flutter_blcs/global/global_theme.dart';
import 'package:flutter_blcs/sp/sp_keys.dart';
import 'package:flutter_blcs/sp/sp.dart';
import 'package:flutter_blcs/utils/function_util.dart';
import 'package:shared_preferences/shared_preferences.dart';
///切换主题通知
class ThemeViewModel extends ChangeNotifier{
  int _color =0;
  ThemeMode _themeMode = ThemeMode.light;

  ThemeViewModel(){
    Sp.get<int>(SP_THEME_COLOR).then((value) => {
      _color = value
    });
    Sp.get<bool>(SP_THEME_MODEL).then((value) => {
      print2("value $value", StackTrace.current),
      _themeMode = value?ThemeMode.dark:ThemeMode.light
    });
  }

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

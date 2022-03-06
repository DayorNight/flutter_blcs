import 'package:flutter/material.dart';
import 'package:flutter_blcs/global/global_theme.dart';
class ThemeViewModel extends ChangeNotifier{
  int _color =0;

  int get getColor{
    return _color;
  }

  void setColor(int color){
    if(color > themes.length -1) return;
    _color = color;
    notifyListeners();
  }
}

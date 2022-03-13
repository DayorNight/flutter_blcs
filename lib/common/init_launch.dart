import 'package:flutter_blcs/viewmodel/theme_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../viewmodel/language_viewmodel.dart';
///初始化程序
class InitLaunch{

  ///初始化主题
  Future<ThemeViewModel> initTheme() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int _color = sp.getInt("themeColor") ?? 0;
    ThemeViewModel themeViewModel = ThemeViewModel();
    print("_color $_color");
    themeViewModel.setColor(_color);
    return themeViewModel;
  }

  ///初始化语言
  Future<LanguageViewModel> initLanguage() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String _language = sp.getString("init_language") ?? "zh";
    LanguageViewModel languageViewModel = LanguageViewModel();
    print("language $_language");
    languageViewModel.setLocale(_language);
    return languageViewModel;
  }

}
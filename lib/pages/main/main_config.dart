import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import 'left_draw/basic_knowledge_page.dart';
import 'left_draw/setting_theme_page.dart';
import 'left_draw/switch_language_page.dart';
import '../home/function_page.dart';
import '../home/me_page.dart';
import '../home/widget_page.dart';

///底部导航栏
final List<BottomNavigationBarItem> bottomItems = [
  BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded), label: S.current.homeView),
  BottomNavigationBarItem(
      icon: Icon(Icons.widgets_rounded), label: S.current.homeFun),
  BottomNavigationBarItem(icon: Icon(Icons.person), label: S.current.homeMe),
];

///页面
final List<Widget> pages = [WidgetPage(), FunctionPage(), MePage()];

///侧边栏list数据
final Map<String,String> leftData = {
  S.current.switchTheme:SettingThemePage.keys,
  S.current.switchLanguage:SwitchLanguagePage.keys,
  S.current.basicKnowledge:BasicKnowledgePage.keys,
};
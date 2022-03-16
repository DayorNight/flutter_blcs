import 'package:flutter/material.dart';
import 'package:flutter_blcs/view/app_lifecycle_view.dart';
import 'package:flutter_blcs/view/demo_view.dart';
import 'package:flutter_blcs/view/forget_psd_view.dart';
import 'package:flutter_blcs/view/lifecycle_view.dart';
import 'package:flutter_blcs/view/login_view.dart';
import 'package:flutter_blcs/view/main_view.dart';
import 'package:flutter_blcs/view/register_view.dart';
import 'package:flutter_blcs/view/setting_theme_view.dart';
import 'package:flutter_blcs/view/switch_language_view.dart';

Map<String, WidgetBuilder> routes = {
  "/":(BuildContext context) => LoginView(),
  "registerView":(BuildContext context) => RegisterView(),
  "forgetPsdView":(BuildContext context) => ForgetPsdView(),
  "mainView":(BuildContext context) => MainView(),
  "themeView":(BuildContext context) => SettingThemeView(),
  "languageView":(BuildContext context) => SwitchLanguageView(),
  "demoView":(BuildContext context) => DemoView(),
  "applifeView":(BuildContext context) => AppLifecycleView(),
  "lifeCycleView":(BuildContext context) => LifeCycleView(),
};
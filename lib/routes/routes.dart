import 'package:flutter/material.dart';
import 'package:flutter_blcs/view/libs/provider_view.dart';
import 'package:flutter_blcs/view/my/app_lifecycle_view.dart';
import 'package:flutter_blcs/view/demo_view.dart';
import 'package:flutter_blcs/view/login/forget_psd_view.dart';
import 'package:flutter_blcs/view/my/lifecycle_view.dart';
import 'package:flutter_blcs/view/login/login_view.dart';
import 'package:flutter_blcs/view/home/main_view.dart';
import 'package:flutter_blcs/view/login/register_view.dart';
import 'package:flutter_blcs/view/libs/screen_adapter_view.dart';
import 'package:flutter_blcs/view/config/setting_theme_view.dart';
import 'package:flutter_blcs/view/config/switch_language_view.dart';

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
  "screenAdapterView":(BuildContext context) => ScreenAdapterView(),
  "providerView":(BuildContext context) => ProviderView(),
};
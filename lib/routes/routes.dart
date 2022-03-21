import 'package:flutter/material.dart';
import 'package:flutter_blcs/pages/libs/provider_view.dart';
import 'package:flutter_blcs/pages/my/app_lifecycle_view.dart';
import 'package:flutter_blcs/pages/demo_view.dart';
import 'package:flutter_blcs/pages/login/forget_psd_view.dart';
import 'package:flutter_blcs/pages/my/lifecycle_view.dart';
import 'package:flutter_blcs/pages/login/login_view.dart';
import 'package:flutter_blcs/pages/main_view.dart';
import 'package:flutter_blcs/pages/login/register_view.dart';
import 'package:flutter_blcs/pages/libs/screen_adapter_view.dart';
import 'package:flutter_blcs/pages/config/setting_theme_view.dart';
import 'package:flutter_blcs/pages/config/switch_language_view.dart';

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
import 'package:flutter/material.dart';
import 'package:flutter_blcs/pages/libs/provider_view.dart';
import 'package:flutter_blcs/pages/my/app_lifecycle_view.dart';
import 'package:flutter_blcs/pages/demo_view.dart';
import 'package:flutter_blcs/pages/login/forget_psd_view.dart';
import 'package:flutter_blcs/pages/my/hero_view.dart';
import 'package:flutter_blcs/pages/my/lifecycle_view.dart';
import 'package:flutter_blcs/pages/login/login_view.dart';
import 'package:flutter_blcs/pages/main_view.dart';
import 'package:flutter_blcs/pages/login/register_view.dart';
import 'package:flutter_blcs/pages/libs/screen_adapter_view.dart';
import 'package:flutter_blcs/pages/config/setting_theme_view.dart';
import 'package:flutter_blcs/pages/config/switch_language_view.dart';
import 'package:flutter_blcs/pages/splash_view.dart';

Map<String, WidgetBuilder> routes = {
  SplashView.keys:(BuildContext context) => SplashView(),
  LoginView.keys:(BuildContext context) => LoginView(),
  RegisterView.keys:(BuildContext context) => RegisterView(),
  ForgetPsdView.keys:(BuildContext context) => ForgetPsdView(),
  MainView.keys:(BuildContext context) => MainView(),
  SettingThemeView.keys:(BuildContext context) => SettingThemeView(),
  SwitchLanguageView.keys:(BuildContext context) => SwitchLanguageView(),
  DemoView.keys:(BuildContext context) => DemoView(),
  AppLifecycleView.keys:(BuildContext context) => AppLifecycleView(),
  LifeCycleView.keys:(BuildContext context) => LifeCycleView(),
  ScreenAdapterView.keys:(BuildContext context) => ScreenAdapterView(),
  ProviderView.keys:(BuildContext context) => ProviderView(),
  HeroView.keys:(BuildContext context) => HeroView(),
};
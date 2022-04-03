import 'package:flutter/material.dart';
import '../pages/libs/provider_view.dart';
import '../pages/my/animation_view.dart';
import '../pages/my/app_lifecycle_view.dart';
import '../pages/demo_view.dart';
import '../pages/login/forget_psd_view.dart';
import '../pages/my/hero_view.dart';
import '../pages/my/lifecycle_view.dart';
import '../pages/login/login_view.dart';
import '../pages/main_view.dart';
import '../pages/login/register_view.dart';
import '../pages/libs/screen_adapter_view.dart';
import '../pages/config/setting_theme_view.dart';
import '../pages/config/switch_language_view.dart';
import '../pages/my/mixed_animation_view.dart';
import '../pages/my/personal_information_view.dart';
import '../pages/my/route_animation_view.dart';
import '../pages/splash_view.dart';
import '../pages/my/personal_view.dart';
class Routers {
  //路由表
  static final Map<String, WidgetBuilder> routes = {
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
    PersonalView.keys:(BuildContext context) => PersonalView(),
    PersonalInformationView.keys:(BuildContext context) => PersonalInformationView(),
    AnimationView.keys:(BuildContext context) => AnimationView(),
    RouteAnimationView.keys:(BuildContext context) => RouteAnimationView(),
    MixedAnimationView.keys:(BuildContext context) => MixedAnimationView(),
  };
  //初始路由
  static final initialRoute = SplashView.keys;
  //路由出错调用
  static final onGenerateRoute = (settings) {
    print("onGenerateRoute:name= ${settings.name}");
    print("onGenerateRoute:arguments= ${settings.arguments}");
    return MaterialPageRoute(builder: (_) => MainView());
  };
  //onGenerateRoute无法生成路由时则在调用 onUnknownRoute
  static final onUnknownRoute = (settings) {
    print("onUnknownRoute:name= ${settings.name}");
    print("onUnknownRoute:arguments= ${settings.arguments}");
    MaterialPageRoute(builder: (_) => LoginView());
  };
}

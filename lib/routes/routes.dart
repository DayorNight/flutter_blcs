import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/utils/print.dart';
import 'package:flutter_blcs/pages/my/animated_switcher_page.dart';
import 'package:flutter_blcs/pages/my/custom_widget_page.dart';
import '../pages/libs/camera_page.dart';
import '../pages/libs/image_picker_page.dart';
import '../pages/libs/net_work_page.dart';
import '../pages/libs/provider_page.dart';
import '../pages/login/guide_page.dart';
import '../pages/main/left_draw/basic_knowledge_page.dart';
import '../pages/my/animation_page.dart';
import '../pages/my/app_lifecycle_page.dart';
import '../pages/demo_page.dart';
import '../pages/login/forget_psd_page.dart';
import '../pages/my/hero_page.dart';
import '../pages/my/isolate_page.dart';
import '../pages/my/json_parse_page.dart';
import '../pages/my/lifecycle_page.dart';
import '../pages/login/login_page.dart';
import '../pages/main/main_page.dart';
import '../pages/login/register_page.dart';
import '../pages/libs/screen_adapter_page.dart';
import '../pages/main/left_draw/setting_theme_page.dart';
import '../pages/main/left_draw/switch_language_page.dart';
import '../pages/my/mixed_animation_page.dart';
import '../pages/my/personal_information_page.dart';
import '../pages/my/route_animation_page.dart';
import '../pages/login/splash_page.dart';
import '../pages/my/personal_page.dart';
class Routers {
  //路由表
  static final Map<String, WidgetBuilder> routes = {
    SplashPage.keys:(BuildContext context) => SplashPage(),
    GuidePage.keys:(BuildContext context) => GuidePage(),
    LoginPage.keys:(BuildContext context) => LoginPage(),
    RegisterPage.keys:(BuildContext context) => RegisterPage(),
    ForgetPsdPage.keys:(BuildContext context) => ForgetPsdPage(),
    MainPage.keys:(BuildContext context) => MainPage(),
    SettingThemePage.keys:(BuildContext context) => SettingThemePage(),
    SwitchLanguagePage.keys:(BuildContext context) => SwitchLanguagePage(),
    DemoPage.keys:(BuildContext context) => DemoPage(),
    AppLifecyclePage.keys:(BuildContext context) => AppLifecyclePage(),
    LifeCyclePage.keys:(BuildContext context) => LifeCyclePage(),
    ScreenAdapterPage.keys:(BuildContext context) => ScreenAdapterPage(),
    ProviderPage.keys:(BuildContext context) => ProviderPage(),
    HeroPage.keys:(BuildContext context) => HeroPage(),
    PersonalPage.keys:(BuildContext context) => PersonalPage(),
    PersonalInformationPage.keys:(BuildContext context) => PersonalInformationPage(),
    AnimationPage.keys:(BuildContext context) => AnimationPage(),
    RouteAnimationPage.keys:(BuildContext context) => RouteAnimationPage(),
    MixedAnimationPage.keys:(BuildContext context) => MixedAnimationPage(),
    AnimatedSwitcherPage.keys:(BuildContext context) => AnimatedSwitcherPage(),
    BasicKnowledgePage.keys:(BuildContext context) => BasicKnowledgePage(),
    CustomWidgetPage.keys:(BuildContext context) => CustomWidgetPage(),
    JsonParsePage.keys:(BuildContext context) => JsonParsePage(),
    NetWorkPage.keys:(BuildContext context) => NetWorkPage(),
    CameraPage.keys:(BuildContext context) => CameraPage(),
    IsolatePage.keys:(BuildContext context) => IsolatePage(),
    ImagePickerPage.keys:(BuildContext context) => ImagePickerPage(),
  };
  //初始路由
  static final initialRoute = SplashPage.keys;
  //出错默认路由
  static final errrorRoute = (BuildContext context) => LoginPage();

  //路由出错调用
  static final onGenerateRoute = (settings) {
    print("onGenerateRoute:name= ${settings.name}");
    print("onGenerateRoute:arguments= ${settings.arguments}");
    println.e('路由出错 前往登录页');
    return MaterialPageRoute(builder: errrorRoute);
  };

  //onGenerateRoute无法生成路由时则在调用 onUnknownRoute
  static final onUnknownRoute = (settings) {
    print("onUnknownRoute:name= ${settings.name}");
    print("onUnknownRoute:arguments= ${settings.arguments}");
    println.e('路由出错 前往登录页');
    MaterialPageRoute(builder: errrorRoute);
  };
}

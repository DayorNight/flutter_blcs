import 'package:flutter/material.dart';
import 'package:flutter_blcs/pages/libs/anchor_page.dart';
import 'package:flutter_blcs/pages/libs/brn_button_page.dart';
import 'package:flutter_blcs/pages/libs/brn_calendar_page.dart';
import 'package:flutter_blcs/pages/libs/brn_guide_page.dart';
import 'package:flutter_blcs/pages/libs/brn_rating_page.dart';
import 'package:flutter_blcs/pages/libs/brn_tag_page.dart';
import 'package:flutter_blcs/pages/libs/bubble_page.dart';
import 'package:flutter_blcs/pages/libs/city_selection_page.dart';
import 'package:flutter_blcs/pages/libs/form_page.dart';
import 'package:flutter_blcs/pages/libs/custom_search_bar_page.dart';
import 'package:flutter_blcs/pages/libs/hive_page.dart';
import 'package:flutter_blcs/pages/libs/input_page.dart';
import 'package:flutter_blcs/pages/libs/notification_page.dart';
import 'package:flutter_blcs/pages/libs/selection_page.dart';
import 'package:flutter_blcs/pages/libs/shared_preferences_page.dart';
import 'package:flutter_blcs/pages/libs/step_bar_page.dart';
import 'package:flutter_blcs/pages/widget/list/about_dialog_page.dart';
import 'package:flutter_blcs/pages/widget/more_widget_page.dart';
import '../common/utils/print.dart';
import '../pages/libs/pull_refresh_page.dart';
import '../pages/widget/Button_page.dart';
import '../pages/widget/dialog_page.dart';
import '../pages/widget/list/app_bar_page.dart';
import '../pages/widget/list/circular_progress_indicator_page.dart';
import '../pages/widget/list/linear_progress_indicator_page.dart';
import '../pages/widget/list/material_app_page.dart';
import '../pages/widget/list/scaffold_page.dart';
import '../pages/widget/list/tab_bar_page.dart';
import '../pages/widget/picker_page.dart';
import '../pages/widget/progress_page.dart';
import '../pages/my/animated_switcher_page.dart';
import '../pages/my/custom_widget_page.dart';
import '../pages/widget/calendar_page.dart';
import '../pages/widget/navigation_page.dart';
import '../pages/widget/tabs_page.dart';
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
import '../pages/widget/list/tab_bar_view_page.dart';
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
    CustomSearchBarPage.keys:(BuildContext context) => CustomSearchBarPage(),
    DialogPage.keys:(BuildContext context) => DialogPage(),
    PickerPage.keys:(BuildContext context) => PickerPage(),
    ButtonPage.keys:(BuildContext context) => ButtonPage(),
    CalendarPage.keys:(BuildContext context) => CalendarPage(),
    NavigationPage.keys:(BuildContext context) => NavigationPage(),
    TabsPage.keys:(BuildContext context) => TabsPage(),
    ProgressPage.keys:(BuildContext context) => ProgressPage(),
    MaterialAppPage.keys:(BuildContext context) => MaterialAppPage(),
    ScaffoldPage.keys:(BuildContext context) => ScaffoldPage(),
    AppBarPage.keys:(BuildContext context) => AppBarPage(),
    AboutDialogPage.keys:(BuildContext context) => AboutDialogPage(),
    TabBarPage.keys:(BuildContext context) => TabBarPage(),
    TabBarViewPage.keys:(BuildContext context) => TabBarViewPage(),
    LinearProgressIndicatorPage.keys:(BuildContext context) => LinearProgressIndicatorPage(),
    CircularProgressIndicatorPage.keys:(BuildContext context) => CircularProgressIndicatorPage(),
    FormPage.keys:(BuildContext context) => FormPage(),
    InputPage.keys:(BuildContext context) => InputPage(),
    BrnMultiChoicePortraitInputFormItemWidget.keys:(BuildContext context) => BrnMultiChoicePortraitInputFormItemWidget(),
    BubblePage.keys:(BuildContext context) => BubblePage(),
    StepBarPage.keys:(BuildContext context) => StepBarPage(),
    NotificationPage.keys:(BuildContext context) => NotificationPage(),
    AnchorPage.keys:(BuildContext context) => AnchorPage(),
    BrnButtonPage.keys:(BuildContext context) => BrnButtonPage(),
    BrnGuidePage.keys:(BuildContext context) => BrnGuidePage(),
    CitySelectionPage.keys:(BuildContext context) => CitySelectionPage(),
    BrnCalendarPage.keys:(BuildContext context) => BrnCalendarPage(),
    BrnRatingPage.keys:(BuildContext context) => BrnRatingPage(),
    BrnTagPage.keys:(BuildContext context) => BrnTagPage(),
    SelectionPage.keys:(BuildContext context) => SelectionPage(),
    MoreWidgetPage.keys:(BuildContext context) => MoreWidgetPage(),
    CalendarPage.keys:(BuildContext context) => CalendarPage(),
    SharedPreferencesPage.keys:(BuildContext context) => SharedPreferencesPage(),
    PullRefreshPage.keys:(BuildContext context) => PullRefreshPage(),
    HivePage.keys:(BuildContext context) => HivePage(),
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

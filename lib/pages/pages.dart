import 'package:flutter_blcs/pages/my/animated_switcher_page.dart';
import 'package:flutter_blcs/pages/my/json_parse_page.dart';
import 'package:flutter_blcs/pages/widget/Button_page.dart';
import 'package:flutter_blcs/pages/widget/calendar_page.dart';
import 'package:flutter_blcs/pages/widget/dialog_page.dart';
import 'package:flutter_blcs/pages/widget/list/app_bar_page.dart';
import 'package:flutter_blcs/pages/widget/list/material_app_page.dart';
import 'package:flutter_blcs/pages/widget/list/scaffold_page.dart';
import 'package:flutter_blcs/pages/widget/navigation_page.dart';
import 'package:flutter_blcs/pages/widget/picker_page.dart';
import 'package:flutter_blcs/pages/widget/progress_page.dart';
import 'package:flutter_blcs/pages/widget/tabs_page.dart';

import 'libs/camera_page.dart';
import 'libs/image_picker_page.dart';
import 'libs/net_work_page.dart';
import 'libs/provider_page.dart';
import 'libs/screen_adapter_page.dart';
import 'my/animation_page.dart';
import 'my/app_lifecycle_page.dart';
import 'my/custom_widget_page.dart';
import 'my/hero_page.dart';
import 'my/isolate_page.dart';
import 'my/lifecycle_page.dart';
import 'my/mixed_animation_page.dart';
import 'my/route_animation_page.dart';

final Map libPages = {
  "全局状态管理": ProviderPage.keys,
  "屏幕适配": ScreenAdapterPage.keys,
  "网络请求": NetWorkPage.keys,
  "相机": CameraPage.keys,
  "ImagePicker": ImagePickerPage.keys,
};

final Map myPages = {
  "应用生命周期": AppLifecyclePage.keys,
  "Widget生命周期": LifeCyclePage.keys,
  "Hero动画": HeroPage.keys,
  "简单动画": AnimationPage.keys,
  "路由动画": RouteAnimationPage.keys,
  "交织动画": MixedAnimationPage.keys,
  "UI切换动画": AnimatedSwitcherPage.keys,
  "自定义Widget": CustomWidgetPage.keys,
  "JSON解析": JsonParsePage.keys,
  "Isolate": IsolatePage.keys,
};

final Map horWidget = {
  "弹窗": DialogPage.keys,
  "进度条": ProgressPage.keys,
  "选择器": PickerPage.keys,
  // "图表": PickerPage.keys,
  "导航": NavigationPage.keys,
  "Tabs": TabsPage.keys,
  "按钮": ButtonPage.keys,
  "日历": CalendarPage.keys,
};

final Map columnWidget = {
  "AppBar": AppBarPage.keys,
  "MaterialApp": MaterialAppPage.keys,
  "Scaffold": ScaffoldPage.keys,
};

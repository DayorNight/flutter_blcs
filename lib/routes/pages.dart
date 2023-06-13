import 'package:flutter/material.dart';
import 'package:flutter_blcs/pages/libs/form_page.dart';
import 'package:flutter_blcs/pages/libs/custom_search_bar_page.dart';
import 'package:flutter_blcs/pages/libs/input_page.dart';
import 'package:flutter_blcs/pages/libs/selection_page.dart';
import 'package:flutter_blcs/pages/my/animated_switcher_page.dart';
import 'package:flutter_blcs/pages/my/json_parse_page.dart';
import 'package:flutter_blcs/pages/widget/Button_page.dart';
import 'package:flutter_blcs/pages/widget/calendar_page.dart';
import 'package:flutter_blcs/pages/widget/dialog_page.dart';
import 'package:flutter_blcs/pages/widget/list/about_dialog_page.dart';
import 'package:flutter_blcs/pages/widget/list/app_bar_page.dart';
import 'package:flutter_blcs/pages/widget/list/material_app_page.dart';
import 'package:flutter_blcs/pages/widget/list/scaffold_page.dart';
import 'package:flutter_blcs/pages/widget/list/tab_bar_page.dart';
import 'package:flutter_blcs/pages/widget/list/tab_bar_view_page.dart';
import 'package:flutter_blcs/pages/widget/navigation_page.dart';
import 'package:flutter_blcs/pages/widget/picker_page.dart';
import 'package:flutter_blcs/pages/widget/progress_page.dart';
import 'package:flutter_blcs/pages/widget/tabs_page.dart';

import '../pages/libs/camera_page.dart';
import '../pages/libs/image_picker_page.dart';
import '../pages/libs/net_work_page.dart';
import '../pages/libs/provider_page.dart';
import '../pages/libs/screen_adapter_page.dart';
import '../pages/my/animation_page.dart';
import '../pages/my/app_lifecycle_page.dart';
import '../pages/my/custom_widget_page.dart';
import '../pages/my/hero_page.dart';
import '../pages/my/isolate_page.dart';
import '../pages/my/lifecycle_page.dart';
import '../pages/my/mixed_animation_page.dart';
import '../pages/my/route_animation_page.dart';
import '../pages/widget/list/circular_progress_indicator_page.dart';
import '../pages/widget/list/linear_progress_indicator_page.dart';

final Map libPages = {
  "全局状态管理": ProviderPage.keys,
  "屏幕适配": ScreenAdapterPage.keys,
  "网络请求": NetWorkPage.keys,
  "相机": CameraPage.keys,
  "ImagePicker": ImagePickerPage.keys,
  "搜索框": CustomSearchBarPage.keys,
  "Form表单": FormPage.keys,
  "输入组件": InputPage.keys,
  "筛选": SelectionPage.keys,
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
  "AboutDialog": AboutDialogPage.keys,
  "AppBar": AppBarPage.keys,
  "MaterialApp": MaterialAppPage.keys,
  "Scaffold": ScaffoldPage.keys,
  "TabBar": TabBarPage.keys,
  "TabBarView": TabBarViewPage.keys,
  "LinearProgressIndicator": LinearProgressIndicatorPage.keys,
  "CircularProgressIndicator": CircularProgressIndicatorPage.keys,
};

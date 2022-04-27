import 'package:flutter_blcs/pages/my/animated_switcher_page.dart';

import 'libs/provider_page.dart';
import 'libs/screen_adapter_page.dart';
import 'my/animation_page.dart';
import 'my/app_lifecycle_page.dart';
import 'my/custom_page.dart';
import 'my/hero_page.dart';
import 'my/lifecycle_page.dart';
import 'my/mixed_animation_page.dart';
import 'my/route_animation_page.dart';

final Map libPages = {
  "全局状态管理": ProviderPage.keys,
  "屏幕适配": ScreenAdapterPage.keys,
};

final Map myPages = {
  "应用生命周期": AppLifecyclePage.keys,
  "Widget生命周期": LifeCyclePage.keys,
  "Hero动画": HeroPage.keys,
  "简单动画": AnimationPage.keys,
  "路由动画": RouteAnimationPage.keys,
  "交织动画": MixedAnimationPage.keys,
  "UI切换动画": AnimatedSwitcherPage.keys,
  "自定义Widget": CustomPage.keys,
};

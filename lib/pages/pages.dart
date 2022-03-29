import 'libs/provider_view.dart';
import 'libs/screen_adapter_view.dart';
import 'my/animation_view.dart';
import 'my/app_lifecycle_view.dart';
import 'my/hero_view.dart';
import 'my/lifecycle_view.dart';

import 'my/route_animation_view.dart';

final Map libPages = {
  "全局状态管理": ProviderView.keys,
  "屏幕适配": ScreenAdapterView.keys,
};

final Map myPages = {
  "应用生命周期": AppLifecycleView.keys,
  "Widget生命周期": LifeCycleView.keys,
  "Hero动画": HeroView.keys,
  "简单动画": AnimationView.keys,
  "路由动画": RouteAnimationView.keys,
};

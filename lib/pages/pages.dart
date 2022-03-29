import 'package:flutter_blcs/pages/libs/provider_view.dart';
import 'package:flutter_blcs/pages/libs/screen_adapter_view.dart';
import 'package:flutter_blcs/pages/my/animation_view.dart';
import 'package:flutter_blcs/pages/my/app_lifecycle_view.dart';
import 'package:flutter_blcs/pages/my/hero_view.dart';
import 'package:flutter_blcs/pages/my/lifecycle_view.dart';

final Map LibPages = {
  "全局状态管理": ProviderView.keys,
  "屏幕适配": ScreenAdapterView.keys,
};

final Map MyPages = {
  "应用生命周期": AppLifecycleView.keys,
  "Widget生命周期": LifeCycleView.keys,
  "Hero动画": HeroView.keys,
  "简单动画": AnimationView.keys,
};

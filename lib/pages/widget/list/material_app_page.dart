import 'package:flutter/material.dart';
import 'package:flutter_blcs/widgets/article_model.dart';

const String materialAppCode =
'''const MaterialApp(
  {
      Key? key,
      // 导航键
      GlobalKey<NavigatorState>? navigatorKey,
      // 脚手架键	
      GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
      // 主页，应用打开时显示的页面
      Widget? home,
      // 应用程序路由表
      Map<String, WidgetBuilder> routes = const <String, WidgetBuilder>{},
      // 显示第一个路由的名称
      String? initialRoute,
      // 路由管理拦截器
      RouteFactory? onGenerateRoute,
      // 生成初始化路由
      InitialRouteListFactory? onGenerateInitialRoutes,
      // 当onGenerateRoute无法生成路由时调用
      RouteFactory? onUnknownRoute,
      // 创建导航器的观察者列表
      List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[],
      // 在导航器上面插入小部件
      TransitionBuilder? builder,
      // 程序切换时显示的标题
      String title = '',
      // 程序切换时生成标题字符串
      GenerateAppTitle? onGenerateTitle,
      // 程序切换时应用图标背景颜色
      Color? color,
      // 主题颜色	
      ThemeData? theme,
      // 暗黑模式主题颜色
      ThemeData? darkTheme,
      // 系统请求“高对比度”使用的主题
      ThemeData? highContrastTheme,
      // 系统请求“高对比度”暗黑模式下使用的主题颜色
      ThemeData? highContrastDarkTheme,
      // 系统请求“高对比度”暗黑模式下使用的主题颜色
      ThemeMode? themeMode = ThemeMode.system,
      // 初始区域设置
      Locale? locale,
      // 本地化代理
      Iterable<LocalizationsDelegate>? localizationsDelegates,
      // 失败或未提供设备的语言环境
      LocaleListResolutionCallback? localeListResolutionCallback,
      // 负责计算语言环境
      LocaleResolutionCallback? localeResolutionCallback,
      // 本地化地区列表
      Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')],
      // 绘制基线网格叠加层（仅debug模式）
      bool debugShowMaterialGrid = false,
      // 显示性能叠加
      bool showPerformanceOverlay = false,
      // 打开栅格缓存图像的棋盘格。
      bool checkerboardRasterCacheImages = false,
      // 打开渲染到屏幕外位图的层的棋盘格。
      bool checkerboardOffscreenLayers = false,
      // 打开显示可访问性信息的叠加层
      bool showSemanticsDebugger = false,
      // 调试显示检查模式横幅
      bool debugShowCheckedModeBanner = true,
      // 应用程序意图的键盘快捷键的默认映射
      Map<ShortcutActivator, Intent>? shortcuts,
      // 包含和定义用户操作的映射
      Map<Type, Action<Intent>>? actions,
      // 应用程序状态恢复的标识符
      String? restorationScopeId,
      // 可滚动小部件的行为方式
      ScrollBehavior? scrollBehavior,
      // 是否使用 继承 MediaQuery
      bool useInheritedMediaQuery = false
  }
)''';
class MaterialAppPage extends StatelessWidget {
  static final String keys = "MaterialAppPage";
  const MaterialAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: 'MaterialApp',
      keys: keys,
      logoColor: Theme.of(context).primaryColor,
      des: "使用Material设计的应用程序，常用与首页构建",
      code: materialAppCode,
    );
  }
}

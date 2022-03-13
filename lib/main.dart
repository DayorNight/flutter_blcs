import 'package:flutter/material.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/global/global_theme.dart';
import 'package:flutter_blcs/view/login_view.dart';
import 'package:flutter_blcs/view/main_view.dart';
import 'package:flutter_blcs/viewmodel/language_viewmodel.dart';
import 'package:flutter_blcs/viewmodel/login_viewmodel.dart';
import 'package:flutter_blcs/viewmodel/theme_viewmodel.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routers/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
  int _color = sp.getInt("color") ?? 0;
  ThemeViewModel themeViewModel = ThemeViewModel();
  print("_color $_color");
  themeViewModel.setColor(_color);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LoginViewModel()),
      ChangeNotifierProvider(create: (context) => LanguageViewModel()),
      ChangeNotifierProvider(create: (context) => themeViewModel),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
GlobalKey<ScaffoldMessengerState> scaffoldKey = GlobalKey();
class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    var locale = Provider.of<LanguageViewModel>(context).getLocale();
    return MaterialApp(
      ///提供全局的 navigatorKey.currentContext
      navigatorKey: navigatorKey,

      ///实现无 context 调用 snack bars 例 scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("show SnackBar")));
      scaffoldMessengerKey: scaffoldKey,

      ///程序进入后的第一个界面 不能与routes 共存
      // home: Scaffold(),
      ///生成路由表
      routes: routes,

      ///初始路由，如果设置了该参数并且在 routes 找到了对应的key，将会展示对应的 Widget ，否则展示 home  //开发阶段快速定位页面
      initialRoute: "/",

      ///当跳转路由时，如果在 routes 找不到对应的 key ，会执行该回调，会调用会返回一个 RouteSettings ，该对象中有 name 路由名称、 arguments 路由参数。
      onGenerateRoute: (settings) {
        print("onGenerateRoute:name= ${settings.name}");
        print("onGenerateRoute:arguments= ${settings.arguments}");
        return MaterialPageRoute(builder: (_) => MainView());
      },

      ///如果提供了 initialRoute ，则用于生成初始路由的路由生成器回调
      onGenerateInitialRoutes: (initialRoute) {
        print("onGenerateInitialRoutes:initialRoute= $initialRoute");
        return [
          MaterialPageRoute(builder: (_) => MainView()),
        ];
      },

      ///效果和 onGenerateRoute 一样，只是先走 onGenerateRoute ，如果onGenerateRoute无法生成路由时则在调用 onUnknownRoute
      onUnknownRoute: (settings) {
        print("onUnknownRoute:name= ${settings.name}");
        print("onUnknownRoute:arguments= ${settings.arguments}");
        MaterialPageRoute(builder: (_) => LoginView());
      },

      ///当构建 Widget 前调用，主要用于字体大小、主题颜色等配置
      // builder: (context,child){
      //   return Scaffold();
      // },
      ///Android：任务管理器的程序快照之上的title
      // title: S.of(context).appName,
      title: '玉米',

      ///如果非空，则调用此回调函数以生成任务管理器标题字符串，否则会使用 title 。每次重建页面时该方法就会回调执行。
      // onGenerateTitle: (context){
      //   print("onGenerateTitle:title= 玉米2");
      //   return "玉米2";
      // },
      //
      ///任务管理器切换时AppBar 的背景色
      color: Colors.black,

      ///主题风格
      theme: ThemeData(
        primarySwatch: themes[Provider.of<ThemeViewModel>(context).getColor],
        // buttonTheme: ButtonThemeData(
        //   buttonColor: themes[Provider.of<ThemeViewModel>(context).getColor],
        //   textTheme:ButtonTextTheme.primary,
        // )
      ),

      ///深色主题风格
      darkTheme: ThemeData(primarySwatch: black),

      ///白天模式和暗黑模式模式切换，默认值为 ThemeMode.system 跟随系统
      themeMode: Provider.of<ThemeViewModel>(context).getThemeMode,

      ///当系统请求“高对比度”时使用的 ThemeData ，当该值为空时会用 theme 应用该主题
      highContrastTheme: ThemeData(
          primarySwatch: themes[Provider.of<ThemeViewModel>(context).getColor]),

      ///当系统再暗黑模式下请求“高对比度”时使用的 ThemeData ，当该值为空时会用 darkTheme 应用该主题。
      highContrastDarkTheme: ThemeData(
          primarySwatch: themes[Provider.of<ThemeViewModel>(context).getColor]),

      ///主要用于语言切换时，如果为 null 时使用系统区域
      locale: locale==''?null:Locale(locale,''),
      ///本地化委托
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      ///监听系统语言切换事件，一些安卓系统特性，可设置多语言列表，默认以第一个列表为默认语言
      localeListResolutionCallback: (locales, supportedLocales) {
        print("localeListResolutionCallback:locales= ${locales?.elementAt(0)}");
        print(
            "localeListResolutionCallback:supportedLocales= ${supportedLocales.toString()}");
        // return locales!.elementAt(0);
      },

      ///监听系统语言切换事件
      localeResolutionCallback: (locale, supportedLocales) {
        print("localeResolutionCallback:languageCode= ${locale?.languageCode}");
        print("localeResolutionCallback:countryCode= ${locale?.countryCode}");
        print(
            "localeResolutionCallback:supportedLocales= ${supportedLocales.toString()}");
        // return Locale(locale!.languageCode,'');
      },

      ///当前应用支持的 Locale 列表
      supportedLocales: S.delegate.supportedLocales,

      ///在 debug 模式下展示基线网格
      debugShowMaterialGrid: false,

      ///显示性能叠加，开启此模式主要用于性能测试
      showPerformanceOverlay: false,

      ///打开栅格缓存图像的棋盘格
      checkerboardRasterCacheImages: false,

      ///打开渲染到屏幕外位图的层的棋盘格
      checkerboardOffscreenLayers: false,

      ///打开显示可访问性信息的叠加层，展示组件之间的关系、占位大小
      showSemanticsDebugger: false,

      ///是否隐藏debug标签
      debugShowCheckedModeBanner: false,

      ///应用程序意图的键盘快捷键的默认映射
      // shortcuts: <ShortcutActivator, Intent>{
      //      ... WidgetsApp.defaultShortcuts,
      //      const SingleActivator(LogicalKeyboardKey.select): const ActivateIntent(),
      //    }
      ///包含和定义用户操作的映射
      // actions: <Type, Action<Intent>>{
      //   ... WidgetsApp.defaultActions,
      //   ActivateAction: CallbackAction<Intent>(
      //     onInvoke: (Intent intent) {
      //       // Do something here...
      //       return null;
      //     },
      //   ),
      // },
      ///应用程序状态恢复的标识符
      // restorationScopeId: scopeId,
      ///统一滚动行为设置，设置后子组件将返回对应的滚动行为
      // scrollBehavior: ScrollBehaviorModified(),
      ///是否继承mediaQuery
      // useInheritedMediaQuery: false,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/ChangeNotifierProvider.dart';
import 'package:flutter_blcs/common/Global.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/routes/home_page.dart';
import 'package:flutter_blcs/widgets/LanguageRoute.dart';
import 'package:flutter_blcs/widgets/LoginRoute.dart';
import 'package:flutter_blcs/widgets/ThemeChangeRoute.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() =>Global.init().then((value) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ThemeModel()),
        ChangeNotifierProvider.value(value: UserModel()),
        ChangeNotifierProvider.value(value: LocaleModel()),
      ],
      child: Consumer2<ThemeModel,LocaleModel>(
          builder: (BuildContext context,themeModel,localeModel,child){
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: themeModel.theme,
              ),
              onGenerateTitle: (context){
                return S.of(context).title;
              },
              home: HomeRoute(),
              //当前的系统语言设置
              locale: localeModel.getLocale(),
              //supportedLocales 表示我们的应用支持的语言列表
              supportedLocales: [
                const Locale('zh',''),
                ...S.delegate.supportedLocales
              ],
              //列表中的元素是生成本地化值集合的工厂
              localizationsDelegates: [
                //为Material 组件库提供的本地化的字符串和其他值，它可以使Material 组件支持多语言
                GlobalMaterialLocalizations.delegate,
                //定义组件默认的文本方向，从左到右或从右到左，这是因为有些语言的阅读习惯并不是从左到右，比如如阿拉伯语就是从右向左的
                GlobalWidgetsLocalizations.delegate,
                S.delegate
              ],
              //回调来监听locale改变的事件
              localeResolutionCallback: (_locale,supportedLocales){
                if(localeModel.getLocale() != null){
                  //如果已经选定语言，则不跟随系统
                  return localeModel.getLocale();
                } else {
                  //跟随系统
                  Locale locale;
                  if(supportedLocales.contains(_locale)){
                    locale = _locale!;
                  } else {
                    //如果系统语言不是中文简体或美国英语，则默认使用美国英语
                    locale= Locale('en', 'US');
                  }
                  return locale;
                }
              },
              routes: <String,WidgetBuilder>{
                "login": (context) => LoginRoute(),
                "themes": (context) => ThemeChangeRoute(),
                "language": (context) => LanguageRoute(),
              },
            );
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

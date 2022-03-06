import 'package:flutter/material.dart';
import 'package:flutter_blcs/global/global_theme.dart';
import 'package:flutter_blcs/viewmodel/login_viewmodel.dart';
import 'package:flutter_blcs/viewmodel/theme_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routers/routes.dart';
final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
  int _color = sp.getInt("color")??0;
  ThemeViewModel themeViewModel = ThemeViewModel();
  print("_color $_color");
  themeViewModel.setColor(_color);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LoginViewModel()),
      ChangeNotifierProvider(create: (context) => themeViewModel),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,//隐藏debug标签
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        primaryColor: themes[Provider.of<ThemeViewModel>(context).getColor],
        buttonTheme: ButtonThemeData(
          buttonColor: themes[Provider.of<ThemeViewModel>(context).getColor],
          textTheme:ButtonTextTheme.primary,
        )
      ),
      routes: routes,
    );
  }
}

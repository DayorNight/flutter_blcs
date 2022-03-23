import 'package:flutter_blcs/viewmodel/language_viewmodel.dart';
import 'package:flutter_blcs/viewmodel/login_viewmodel.dart';
import 'package:flutter_blcs/viewmodel/theme_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providerDatas = [
  ChangeNotifierProvider(create: (context) => LoginViewModel()),
  ChangeNotifierProvider(create: (context) => LanguageViewModel()),
  ChangeNotifierProvider(create: (context) => ThemeViewModel()),
];
import 'package:flutter_blcs/viewmodel/language_viewmodel.dart';
import 'package:flutter_blcs/viewmodel/login_viewmodel.dart';
import 'package:flutter_blcs/viewmodel/theme_viewmodel.dart';
import 'package:provider/provider.dart';

var providerDatas = [
  ChangeNotifierProvider(create: (context) => LoginViewModel()),
  ChangeNotifierProvider(create: (context) => LanguageViewModel()),
  ChangeNotifierProvider(create: (context) => ThemeViewModel()),
];
import 'package:shared_preferences/shared_preferences.dart';

const String SP_THEME_COLOR = "themeColor";
const String SP_INIT_LANGUAGE = "language";

///获取主题原色
Future<int> getThemeColor() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  int _color = sp.getInt(SP_THEME_COLOR) ?? 0;
  return _color;
}
///获取语言
Future<String> getLanguage() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  String _language = sp.getString(SP_INIT_LANGUAGE) ?? "zh";
  return _language;
}
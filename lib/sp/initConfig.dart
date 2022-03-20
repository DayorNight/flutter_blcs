import 'package:shared_preferences/shared_preferences.dart';
///获取主题原色
Future<int> getThemeColor() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  int _color = sp.getInt("themeColor") ?? 0;
  return _color;
}
///获取语言
Future<String> getLocal() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  String _language = sp.getString("init_language") ?? "zh";
  return _language;
}
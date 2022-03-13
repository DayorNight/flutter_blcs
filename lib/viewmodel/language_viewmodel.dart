import 'package:flutter/cupertino.dart';
///切换语言通知
class LanguageViewModel extends ChangeNotifier {
  String _language = 'zh';

  void setLocale(String language) {
    _language = language;
    notifyListeners();
  }

  String getLocale() {
    return _language;
  }
}

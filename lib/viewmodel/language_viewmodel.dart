import 'package:flutter/cupertino.dart';
import 'package:flutter_blcs/sp/initConfig.dart';
import 'package:shared_preferences/shared_preferences.dart';
///切换语言通知
class LanguageViewModel extends ChangeNotifier {
  String _language = 'zh';

  LanguageViewModel(){
    getLanguage().then((value) => {
      _language = value
    });
  }

  void setLocale(String language) {
    _language = language;
    notifyListeners();
  }

  String getLocale() {
    return _language;
  }
}

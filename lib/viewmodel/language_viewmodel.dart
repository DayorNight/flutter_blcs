import 'package:flutter/cupertino.dart';
import 'package:flutter_blcs/common/sp/sp.dart';
import 'package:flutter_blcs/common/sp/sp_keys.dart';
///切换语言通知
class LanguageViewModel extends ChangeNotifier {
  String _language = 'zh';

  LanguageViewModel(){
    Sp.get<String>(SP_INIT_LANGUAGE).then((value) => {
      _language = value??''
    });
  }

  void setLanguage(String language) {
    _language = language;
    notifyListeners();
  }

  String getLanguage() {
    return _language;
  }

  Locale? getLocale() {
    return _language==''?null:Locale(_language,'');
  }
}

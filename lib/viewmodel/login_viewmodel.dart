import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/http/global.dart';
import 'package:flutter_blcs/models/login_model.dart';
import 'package:flutter_blcs/app.dart';
import 'package:flutter_blcs/pages/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/utils/navigator.dart';
///登录通知
class LoginViewModel extends ChangeNotifier {

  void login(String user,String pass) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    Response result = await loginModel(user, pass);
    print(result);
    if (result.data["success"]) {
      Global.getInstance().token = result.data["data"]["token"];
      Global.getInstance().user = result.data["data"]["user"];
      sp.setString("token", result.data["data"]["token"]);
      Global.getInstance().dio.options.headers["token"] =
      result.data["data"]["token"];
      NavigatorUtils.fadePushAndRemove(navigatorKey.currentContext!, MainPage.keys);
    } else {
      print(result.data["msg"]);
    }
  }

  void tokenLogin(String token) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    Response result = await tokenLoginModel();
    if (result.data["success"]) {
      Global.getInstance().user = result.data["data"];
      NavigatorUtils.fadePushAndRemove(navigatorKey.currentContext!, MainPage.keys);
    } else {
      sp.remove("token");
    }
  }
}

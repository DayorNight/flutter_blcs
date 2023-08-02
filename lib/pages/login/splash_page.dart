import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/static.dart';
import 'package:flutter_blcs/common/utils/function.dart';
import 'package:flutter_blcs/common/utils/print.dart';
import 'package:flutter_blcs/config/config.dart';
import 'package:flutter_blcs/pages/login/login_page.dart';
import 'package:flutter_blcs/pages/main/main_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/sp/sp_keys.dart';
import '../../common/utils/navigator.dart';
import 'guide_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  static final String keys = "/";

  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool hadInit = false;
  double size = 200;
  String text = "Welcome";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (hadInit) {
      return;
    }
    hadInit = true;
    new Future.delayed(Duration(seconds: 3, milliseconds: 500), () async{
      if (!mounted) return;
      println.i('DEBUG模式 ${Config.DEBUG}');
      if (Config.DEBUG) {
        //登陆
        NavigatorUtils.fadePushAndRemove(context, MainPage.keys);
        return;
      }
      //判断是否首次安装
      SharedPreferences sp = await SharedPreferences.getInstance();
      bool? isFirstInstall = sp.get(SP_FIRST_INSTALL) as bool?;
      println.i('是否首次安装 $isFirstInstall');
      if (isFirstInstall??true){ //首次安装
        NavigatorUtils.fadePushAndRemove(context, GuidePage.keys);
        sp.setBool(SP_FIRST_INSTALL, false);
        return;
      }

      //判断是否自动登录
      bool? autoLogin = sp.get(SP_AUTO_LOGIN) as bool?;
      println.i('是否登录过 $autoLogin');
      if(autoLogin??false){
        NavigatorUtils.fadePushAndRemove(context, MainPage.keys);
        return;
      }
      //前往登录页
      NavigatorUtils.fadePushAndRemove(context, LoginPage.keys);
    });
  }

  @override
  Widget build(BuildContext context) {
    screenInit(context);
    var primaryColor = Theme.of(context).primaryColor;
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipOval(
            child: Image.asset(Images.logo),
          ),
          SizedBox(
            height: 0.1.sh,
          ),
          Container(
            width: size,
            height: size,
            child: FlareActor(Flares.logo,
                alignment: Alignment.topCenter,
                fit: BoxFit.fill,
                color: primaryColor,
                animation: "Placeholder"),
          ),
          Text(
            text,
            style: GoogleFonts.akronim(
              textStyle: Theme.of(context).textTheme.headline4,
              fontSize: 150.sp,
              color: primaryColor,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

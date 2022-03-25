import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/static.dart';
import 'package:flutter_blcs/common/utils/function.dart';
import 'package:flutter_blcs/pages/login/login_view.dart';
import 'package:flutter_blcs/pages/main_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashView extends StatefulWidget {
  static final String keys = "/";


  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool hadInit = false;
  double size = 200;
  bool isLogin = true;
  String text = "Welcome";
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (hadInit) {
      return;
    }
    hadInit = true;
    new Future.delayed(Duration(seconds: 3, milliseconds: 500), () {
      if(!mounted) return;
      if (isLogin) {//登陆
        Navigator.of(context).popAndPushNamed(MainView.keys);
      } else {
        Navigator.of(context).popAndPushNamed(LoginView.keys);
      }
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

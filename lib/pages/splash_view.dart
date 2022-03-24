import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/utils/function.dart';
import 'package:flutter_blcs/widgets/diff_scale_text.dart';
import 'package:flutter_blcs/widgets/mole_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool hadInit = false;
  double size = 200;
  String text = "Welcome";
  double fontSize = 76;
  bool isLogin = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (hadInit) {
      return;
    }
    hadInit = true;

    // Future.delayed(const Duration( milliseconds: 500), () {
    //   setState(() {
    //     text = "Welcome";
    //     fontSize = 60;
    //   });
    // });
    //
    // new Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
    //   setState(() {
    //     text = "GSYGithubApp";
    //     fontSize = 60;
    //   });
    // });
    //
    // new Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
    //   if (isLogin) {//登陆
    //     Navigator.of(context).pushNamed('mainView');
    //   } else {
    //     Navigator.of(context).pushNamed('loginView');
    //   }
    // });
  }
  @override
  void reassemble() {
    super.reassemble();
    text = "Welcome";
  }
  @override
  Widget build(BuildContext context) {
    screenInit(context);
    return Container(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          Center(
            child: CircleAvatar(
              child: Image.asset("static/images/ic_avator.png",width: 300.w,height: 300.w,),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0.3),
            child: DiffScaleText(
              text: text,
              textStyle: GoogleFonts.akronim().copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: fontSize,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.0, 0.8),
            child: Mole(),
          ),
          new Align(
            alignment: Alignment.bottomCenter,
            child: new Container(
              width: size,
              height: size,
              child: new FlareActor("static/assets/flare_flutter_logo_.flr",
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fill,
                  animation: "Placeholder"),
            ),
          )
        ],
      ),
    );
  }
}

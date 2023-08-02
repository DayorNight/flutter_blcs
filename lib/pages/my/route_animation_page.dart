import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/base_page_widget.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/routes/route_page_animation.dart';
import '../../common/utils/code.dart';
import '../../generated/l10n.dart';

class RouteAnimationPage extends BasePageWidget {
  static const String keys = 'routeAnimationView';
  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => S.current.routeAnimation;

  @override
  String? get getDes => RouteAnimationDes;

  @override
  String? get getCode => RouteAnimationCode;

  static String value = "默认路由方式";
  static String value1 = "左右切换方式";
  static String value2 = "PageRouteBuilder自定义方式";
  static String value3 = "继承PageRoute自定义方式";
  static String pages = '页面B';
  const RouteAnimationPage({Key? key}) : super(key: key);

 @override
  Widget? buildBody(BuildContext context) {
    var title = S.current.routeAnimation;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //默认路由方式
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => pageB(context,title),
                      //fullscreenDialog: true //上下切换
                    ));
              },
              child: Text(value)),
          //左右切换方式
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => pageB(context,title),
                    ));
              },
              child: Text(value1)),
          //PageRouteBuilder自定义方式
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder:
                            (context, animation, secondaryAnimation) {
                          return FadeTransition(
                            opacity: animation,
                            child: pageB(context,title),
                          );
                        },
                        transitionDuration: Duration(milliseconds: 500)));
              },
              child: Text(value2)),
          //继承PageRoute自定义方式
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    FadeRoute(builder: (context) => pageB(context,title)));
              },
              child: Text(value3)),
        ],
      ),
    );
  }

  ///B页面
  Scaffold pageB(BuildContext context,String title) {
    return Scaffold(
      appBar: getAppBar(context,title),
      body: Center(
        child: Text(pages),
      ),
    );
  }

}

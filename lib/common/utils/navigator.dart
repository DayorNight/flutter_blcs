import 'package:flutter/material.dart';

import '../../pages/main/main_page.dart';
import '../../routes/routes.dart';

class NavigatorUtils {
  /// 淡入淡出
  static fadePush(BuildContext context,String routeName,{Object? arguments}){
      Navigator.push(context,route(routeName,arguments: arguments));
  }

  static fadePushAndRemove(BuildContext context,String routeName,{Object? arguments}){
    Navigator.pushAndRemoveUntil(context, route(routeName,arguments: arguments) , (route) => false);
  }

  static Route route(String routeName,{Object? arguments}){
   var route = Routers.routes[routeName];
   return PageRouteBuilder(
        settings: RouteSettings(
          name: routeName,
          arguments: arguments,
        ),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: Builder(builder: route??Routers.errrorRoute),
          );
        },
        transitionDuration: Duration(milliseconds: 500));
  }

  static toClass(BuildContext context,Widget widget){
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}


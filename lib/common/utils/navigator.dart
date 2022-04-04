import 'package:flutter/material.dart';

import '../../pages/main_view.dart';
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
   return PageRouteBuilder(
        settings: RouteSettings(
          name: routeName,
          arguments: arguments,
        ),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: Builder(builder: Routers.routes[routeName]!,),
          );
        },
        transitionDuration: Duration(milliseconds: 500));
  }


}
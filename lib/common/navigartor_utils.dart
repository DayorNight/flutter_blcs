import 'package:flutter/material.dart';

extension NavigatorExtension on Navigator {
  @optionalTypeArgs
  static Future<T?> fadePush<T extends Object?>(BuildContext context,String routeName,{Object? arguments} ) {
    return Navigator.of(context).push(PageRouteBuilder(
        settings: RouteSettings(
          name: routeName,
          arguments: arguments,
        ),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
          );
        },
        transitionDuration: Duration(milliseconds: 500)));
  }
}

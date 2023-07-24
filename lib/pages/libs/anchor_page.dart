import 'dart:math';

import 'package:bruno/bruno.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/base_page_widget.dart';
import 'package:flutter_blcs/common/utils/print.dart';
import 'package:flutter_blcs/generated/l10n.dart';

class AnchorPage extends BasePageWidget {
  static const keys = 'AnchorPage';

  @override
  Widget? buildBody(BuildContext context) {
    return BrnAnchorTab(
      tabBarStyle: BrnAnchorTabBarStyle(dragStartBehavior: DragStartBehavior.start),
      itemCount: 10,
      widgetIndexedBuilder: (context, index) {
        return Container(
          child: Center(child: Text('$index')),
          height: Random().nextInt(400).toDouble(),
          color: Color.fromARGB(Random().nextInt(255), Random().nextInt(255),
              Random().nextInt(255), Random().nextInt(255)),
        );
      },
      tabIndexedBuilder: (context, index) {
        println.i('index $index');
        return BadgeTab(text: 'index $index');
      },
    );
  }

  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => S.current.anchor_title;

}

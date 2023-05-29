import 'dart:math';

import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/widgets/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnchorTabPage extends StatelessWidget {
  static const keys = 'AnchorTabPage';

  const AnchorTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ArticleModel(
        title: S.current.AnchorTab,
        keys: AnchorTabPage.keys,
        logoColor: Theme
            .of(context)
            .primaryColor,
        headerChild: BrnAnchorTab(
          itemCount: 10,
          widgetIndexedBuilder: (context, index) {
            return Container(
              child: Center(child: Text('$index')),
              height: 200.r,
              color: Colors.red
            );
          },
          tabIndexedBuilder: (context, index) {
            return BadgeTab(
                text: 'index $index'
            );
          },
        ),
      ),
    );
  }
}

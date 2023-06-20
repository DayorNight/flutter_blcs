import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/BasePageWidget.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/widgets/article_model.dart';

class BubblePage extends BasePageWidget {
  static const keys = 'BubblePage';

  @override
  String? get getTitle => S.current.bubble_title;

  @override
  String? get getKeys => keys;

  @override
  Widget? buildBody(BuildContext context) {
    return Column(
      children: [
        commonButton(content: 'BrnBubbleText', des: '气泡背景文本展示，支持展开/收起操作'),
        BrnBubbleText(
          maxLines: 2,
          text:
          '内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容内容',
          onExpanded: (isExpanded) {
            String str = isExpanded ? "展开了" : "收起了";
            BrnToast.show("我$str", context);
          },
        ),
        commonButton(
            content: 'BrnInsertInfo', des: '该元件的背景是不规则的边框，常用于卡片的下方作为备注信息'),
        BrnInsertInfo(
            maxLines: 2,
            infoText:
            '推荐理由：“满五唯一”“临近地铁”“首付低”，多出折行显示，最多两行。推荐理由：“满五唯一”“临近地铁”“首付低”，多出折行显示，最多两行。')
      ],
    );
  }
}

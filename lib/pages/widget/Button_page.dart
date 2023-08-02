import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/base_page_widget.dart';
import 'package:flutter_blcs/common/weiget_util.dart';

class ButtonPage extends BasePageWidget {
  static final String keys = "ButtonPage";
  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => '选择器';

  @override
  Widget? buildBody(BuildContext context) {
    return Column(
      children: [
        commonButton(content: "普通弹窗",des: "说明",onTop: (){}),
      ],
    );
  }

}

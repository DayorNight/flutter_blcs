import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/base_page_state_widget.dart';
import 'package:flutter_blcs/common/weiget_util.dart';


class PickerPage extends BasePageStateWidget {
  static final String keys = "PickerPage";

  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => '按钮';


  @override
  Widget? buildBody(BuildContext context) {
    return Column(
      children: [
        commonButton(content: "普通弹窗",des: "说明",onTop: (){}),
      ],
    );
  }
}

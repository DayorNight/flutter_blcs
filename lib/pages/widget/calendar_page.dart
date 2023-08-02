import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/base_page_widget.dart';
import 'package:flutter_blcs/common/weiget_util.dart';


class CalendarPage extends BasePageWidget {
  static final String keys = "CalendarPage";
  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => '日历';

  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget? buildBody(BuildContext context) {
    return Column(
      children: [
        commonButton(content: "日历",des: "说明",onTop: (){}),
      ],
    );
  }


}

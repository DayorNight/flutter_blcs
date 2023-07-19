import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/BasePageWidget.dart';
import 'package:flutter_blcs/generated/l10n.dart';

class BrnCalendarPage extends BasePageWidget {
  static const keys = 'BrnCalendarPage';

  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => S.current.calendar_title;

  @override
  Widget? buildHeaderBody(BuildContext context) {
    return Column(
      children: [
        Text('单选、无控制 bar、周视图'),
        BrnCalendarView(
          displayMode: DisplayMode.week,
          selectMode: SelectMode.single,
          showControllerBar: false,
          dateChange: (date) {
            BrnToast.show('date： $date ', context);
          },
        ),
        Text('单选、无控制、周视图、自定义 week name'),
        BrnCalendarView(
          displayMode: DisplayMode.week,
          selectMode: SelectMode.single,
          showControllerBar: false,
          weekNames: ['星期天', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'],
          dateChange: (date) {
            BrnToast.show('date： $date ', context);
          },
        ),
        Text('单选、周视图、控制 bar'),
        BrnCalendarView(
          displayMode: DisplayMode.week,
          selectMode: SelectMode.single,
          dateChange: (date) {
            BrnToast.show('date： $date ', context);
          },
        ),
        Text('范围选、周视图、控制 bar'),
        BrnCalendarView(
          displayMode: DisplayMode.week,
          selectMode: SelectMode.range,
          rangeDateChange: (date) {
            BrnToast.show('date： $date ', context);
          },
        ),
        Text('单选、月视图、控制 bar'),
        BrnCalendarView(
          displayMode: DisplayMode.week,
          selectMode: SelectMode.range,
          rangeDateChange: (date) {
            BrnToast.show('date： $date ', context);
          },
        ),
        Text('范围选、月视图、控制 bar'),
        BrnCalendarView(
          displayMode: DisplayMode.week,
          selectMode: SelectMode.range,
          rangeDateChange: (date) {
            BrnToast.show('date： $date ', context);
          },
        ),
      ],
    );
  }
}

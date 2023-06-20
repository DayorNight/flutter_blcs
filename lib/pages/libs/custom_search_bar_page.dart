import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/BasePageWidget.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/widgets/custom_search_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBarPage extends BasePageWidget {
  static const keys = 'CustomSearchBarPage';
  @override
  String? get getTitle => S.current.searchTitle;

  @override
  String? get getKeys => keys;

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Padding(padding: EdgeInsets.only(right: 0.3.sw),child: CustomSearchBarWidget()),
        BrnSearchText(
          innerPadding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
          maxHeight: 60,
          innerColor: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          normalBorder:
          Border.all(color: Color(0xFFF0F0F0), width: 1, style: BorderStyle.solid),
          activeBorder:
          Border.all(color: Color(0xFF0984F9), width: 1, style: BorderStyle.solid),
          onTextClear: () {
            // focusNode.unfocus();
            return false;
          },
          autoFocus: true,
          action: Container(),
          onActionTap: () {
            BrnToast.show('取消', context);
          },
          onTextCommit: (text) {
            BrnToast.show('提交内容 : $text', context);
          },
          onTextChange: (text) {
            BrnToast.show('输入内容 : $text', context);
          },
        )
      ],
    );
  }
}

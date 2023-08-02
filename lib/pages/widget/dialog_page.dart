import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/base_page_state_widget.dart';
import 'package:flutter_blcs/common/utils/bottom_menu.dart';
import 'package:flutter_blcs/common/utils/dialog.dart';
import 'package:flutter_blcs/common/utils/loading.dart';
import 'package:flutter_blcs/common/utils/tips.dart';
import 'package:flutter_blcs/common/utils/toast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogPage extends BasePageStateWidget {
  static final String keys = "DialogPage";
  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => '弹窗';

  ValueNotifier<String> _selection = ValueNotifier('Dialog');
  List<String> menus = ["Dialog", "BottomMenu", "Tips", "Loading", "Toast"];

  @override
  Widget? buildHeaderBody(BuildContext context) {
    return Container(
      height: 60.w,
      margin: EdgeInsets.only(bottom: 10.w),
      child: ValueListenableBuilder<String>(
        valueListenable: _selection,
        builder: (context,value,_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(value),
              PopupMenuButton<String>(
                offset: Offset(60.w, 60.w),
                icon: Icon(Icons.keyboard_arrow_down_sharp),
                onSelected: (String result) {
                    _selection.value = result;
                },
                itemBuilder: (BuildContext context) =>
                    menus.map<PopupMenuEntry<String>>((value) {
                      return PopupMenuItem<String>(
                        value: value,
                        child: Center(child: Text(value)),
                      );
                    }).toList(),
              ),
            ],
          );
        }
      ),
    );
  }

  @override
  Widget? buildFooterBody(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: _selection,
      builder: (context,value,_) {
        return Column(
          children: _listWidget(context,value),
        );
      }
    );
  }

  _listWidget(BuildContext context,String value) {
    switch (value) {
      case "Dialog":
        return listDialog(context);
      case "BottomMenu":
        return listBottomMenu(context);
      case "Tips":
        return listTips(context);
      case "Loading":
        return listLoading(context);
      case "Toast":
        return listToast(context);
    }
  }

}

import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GlobalKey _key = GlobalKey();
GlobalKey _key1 = GlobalKey();
GlobalKey _key2 = GlobalKey();
GlobalKey _key3 = GlobalKey();

///https://bruno.ke.com/page/v2.2.0/widgets/brn-popup-window
listTips(BuildContext context) {
  return [
    commonButton(
        key: _key,
        content: "BrnPopupWindow",
        des: "显示在目标控件下方的 Tips 提示",
        onTop: () {
          // popKey值和目标组件的GlobalKey要保持一致*
          BrnPopupWindow.showPopWindow(context, "订阅搜索条件，新上房源立即通知", _key,
              hasCloseIcon: true);
        }),
    commonButton(
        key: _key1,
        content: "BrnPopupWindow",
        des: "显示在目标控件的上方的 Tips 提示",
        onTop: () {
          BrnPopupWindow.showPopWindow(context, "订阅搜索条件，新上房源立即通知", _key1,
              hasCloseIcon: true,
              dismissCallback: () {},
              popDirection: BrnPopupDirection.top);
        }),
    OutlinedButton(key: _key2,
        onPressed: (){
      BrnPopupListWindow.showPopListWindow(
        context,
        _key2,
        data: ['选项一', '选项二', '选项三'],
        onItemClick: (index, item) {
          BrnToast.show(item, context);
          return false;
        },
      );
    }, child: Text("BrnPopupListWindow")),
    OutlinedButton(key: _key3,
        onPressed: (){
          BrnPopupListWindow.showButtonPanelPopList(
            context,
            _key3,
            data: ['选项一', '选项二', '选项三'],
            onItemClick: (index, item) {
              BrnToast.show(item, context);
              return false;
            },
          );
        }, child: Text("BrnPopupListWindow")),
  ];
}

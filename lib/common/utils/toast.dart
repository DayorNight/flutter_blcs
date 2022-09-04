import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/weiget_util.dart';

listToast(BuildContext context) {
  return [
    commonButton(
        content: "BrnToast",
        des: "简短的文本提示",
        onTop: () {
          /// 显示在中间。如不设置duration则会自动根据内容长度来计算（更友好，最长5秒）
          BrnToast.showInCenter(text: "text", context: context);
        }),

    commonButton(
        content: "BrnToast",
        des: "简短的文本提示",
        onTop: () {
          BrnToast.show("共找到10932个结果", context, duration: Duration(seconds: 3));
        }),
    commonButton(
        content: "BrnToast",
        des: "简短的文本提示带图标",
        onTop: () {
          BrnToast.show(
            "失败图标Toast",
            context,
            preIcon: Image.asset(
              "static/images/ic_avator.png",
              width: 24,
              height: 24,
            ),
            duration: BrnDuration.short,
          );
        }),
    commonButton(
        content: "SnackBar",
        des: "底部弹出提示",
        onTop: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("底部弹出提示")));
        }),
  ];
}
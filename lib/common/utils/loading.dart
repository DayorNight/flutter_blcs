import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/weiget_util.dart';

listLoading(BuildContext context) {
  return [
    commonButton(
        content: "BrnLoadingDialog",
        des: "显示一个Loading",
        onTop: () {
          //显示
          BrnLoadingDialog.show(context);
          //关闭
          // BrnLoadingDialog.dismiss(context);
        }),
  ];
}
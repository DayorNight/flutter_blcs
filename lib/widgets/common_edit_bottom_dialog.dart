import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/custom_color.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef ValueCallback = void Function(String content);

class CommonEditBottomDialog extends StatelessWidget {
  final String? title;
  final String? onConfirmBtnText;
  final String? cancelBtnText;

  /// 确定回调
  final ValueCallback? onConfirmCallBack;

  /// 取消回调
  final VoidCallback? onCancelCallBack;

  Future<T?> show<T>(BuildContext context) {
    return showModalBottomSheet<T>(
      context: context,
      builder: build,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      enableDrag: false,
      isDismissible: false,
    );
  }

  CommonEditBottomDialog({
    Key? key,
    this.onConfirmCallBack,
    this.onCancelCallBack,
    this.onConfirmBtnText,
    this.title,
    this.cancelBtnText,
  }) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, cons) {
        return SingleChildScrollView(
          child: Container(
            // height: 249.r,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r)),
            ),
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => onCancle(context),
                      child: Padding(padding: EdgeInsets.all(16.r),
                              child: Text(
                                cancelBtnText ?? S.current.common_cancel,
                                style: TextStyle(
                                  color: color_858B9B,
                                  fontSize: 26.r
                                ),
                              )),
                    ),
                    Text(
                      title ?? "",
                        style:TextStyle(
                          color: color_2A2F3C,
                          fontWeight: FontWeight.bold,
                          fontSize: 26.sp,
                        )
                    ),
                    InkWell(
                      onTap: () => onConfirm(context),
                      child: Padding(
                          padding: EdgeInsets.all(16.r),
                          child: Text(
                              onConfirmBtnText ?? S.current.common_confirm,
                              style: TextStyle(
                                  color: color_5590F6, fontSize: 26.r))),
                    ),
                  ],
                ),
                Divider(
                  color: color_E5E5E5,
                  height: 0.5.r,
                ),
                Container(
                    color: color_E5E5E5.withAlpha(8),
                    width: ScreenUtil().screenWidth,
                    height: 40.r,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 17.r),
                    child: Text(
                      "描述内容",
                      style: TextStyle(color: color_F55656),
                    )),
                Container(
                  height: 240.r,
                  margin: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: color_E8EAEF,width: 1.r)
                  ),
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(12.r),
                  child: TextField(
                    maxLines: null,
                    controller: _controller,
                      keyboardType:TextInputType.multiline,
                    decoration: InputDecoration(
                        isCollapsed: true,
                        counterText: '',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        hintText: "请输入内容",
                        hintStyle: TextStyle(color: color_BCC1CD, fontSize: 26.r)),
                    autofocus: true,
                    maxLength: 1000,
                    style: TextStyle(
                      color: color_2A2F3C,
                      fontSize: 16.r,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void onCancle(BuildContext context) {
    Navigator.pop(context);
    onCancelCallBack?.call();
  }

  void onConfirm(BuildContext context) {
    Navigator.pop(context);
    onConfirmCallBack?.call(_controller.text);
  }
}

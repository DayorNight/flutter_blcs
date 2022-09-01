import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/widgets/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path/path.dart';

import '../../../widgets/dialog/dialog_utils.dart';

class DialogPage extends StatelessWidget {
  static final String keys = "applifeView";

  const DialogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: '弹窗',
      keys: keys,
      logoColor: Theme.of(context).primaryColor,
      headerChild: Column(
        children: _listWidget(context),
      ),
    );
  }

  List<Widget> _listWidget(BuildContext context) {
    return [
      commonButton("普通弹窗",()=> dialog1(context)),
      commonButton("简单弹窗",()=> dialog2(context)),
      commonButton("列表弹窗",()=> showListDialog(context)),
      commonButton("日历弹窗",()=> showDatePicker1(context)),
      commonButton("底部弹窗",()=> showModalBottomSheet1(context)),
      commonButton("底部提示弹窗",()=> ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("message")))),
      commonButton("底部输入框1",()=>picker(context)),
      commonButton("底部输入框2",()=>_showBottomWriteDialog(context)),
      commonButton("BrnDatePicker",()=> _brnDatePicker(context)),
      commonButton("BrnDateRangePicker",()=> _brnDateRangePicker(context)),
      commonButton("BrnMultiDataPicker",()=> _brnMultiDataPicker(context)),
      commonButton("BrnMultiColumnPicker",()=> _brnMultiColumnPicker(context)),
      commonButton("BrnMultiSelectListPicker",()=> _brnMultiSelectListPicker(context)),
      commonButton("BrnMultiSelectTagsPicker",()=> _brnMultiSelectTagsPicker(context)),
      commonButton("BrnSelectTagsWithInputPicker",()=> _brnSelectTagsWithInputPicker(context)),
    ];
  }

  OutlinedButton commonButton(String text,VoidCallback? function) {
    return OutlinedButton(
        onPressed: function,
        child: SizedBox(
          width: 0.8.sw,
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 30.sp),
            ),
          ),
        ));
  }
  /// 普通弹窗
  void dialog1(BuildContext context) {
    showCustomDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: <Widget>[
            TextButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("删除"),
              onPressed: () {
                // 执行删除操作
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  /// 普通弹窗
  void dialog2(BuildContext context) {
    showCustomDialog<bool>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('请选择语言'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                // 返回1
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('中文简体'),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {// 返回2
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('美国英语'),
              ),
            ),
          ],
        );
      },
    );
  }
  /// https://bruno.ke.com/page/widgets/brn-bottom-picker
  /// 自定义的从底部弹出的 picker 框，支持高度的自定义（内容、头部）。解决了 picker 中有输入框，键盘遮挡等问题。
  picker(BuildContext context) {
   BrnBottomPicker.show(context,
        barrierDismissible: false,
        contentWidget: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '键盘抬起，不遮挡picker',
              style: TextStyle(
                color:Colors.yellow,
                fontSize: 20,
              ),
            ),
            TextField(
              decoration: InputDecoration(hintText: '请输入'),
            )
          ],
        ));
  }

  ///https://bruno.ke.com/page/widgets/brn-bottom-write-picker
  ///从底部有输入框弹框
  void _showBottomWriteDialog(BuildContext context) {
    BrnBottomWritePicker.show(context,  title: '写跟进',
      hintText: '请输入',
      confirmDismiss: true,
      onConfirm: (context, string) {
        Navigator.of(context).pop();
      },
      onCancel: (string){
        BrnToast.show(string!, context);
        Navigator.of(context).pop();
      },
      defaultText: '',);
  }
  ///https://bruno.ke.com/page/widgets/brn-date-picker
  ///可用于页面底部弹出选择【单个】时间点的情况
  _brnDatePicker(BuildContext context) {
    BrnDatePicker.showDatePicker(context,
        // maxDateTime: DateTime.parse(MAX_DATETIME),
        // minDateTime: DateTime.parse(MIN_DATETIME),
        initialDateTime: DateTime.parse('2020-01-01 18:26:59'),
        // 支持DateTimePickerMode.date、DateTimePickerMode.datetime、DateTimePickerMode.time
        pickerMode: BrnDateTimePickerMode.date,
        minuteDivider: 30,
        pickerTitleConfig: BrnPickerTitleConfig.Default,
        dateFormat: "yy-mm-dd", onConfirm: (dateTime, list) {
          BrnToast.show("onConfirm:  $dateTime   $list", context);
        },
        onClose: () {
          print("onClose");
        },
        onCancel: () {
          print("onCancel");
        },
        onChange: (dateTime, list) {
          print("onChange:  $dateTime    $list");
        });BrnDatePicker.showDatePicker(context,
        // maxDateTime: DateTime.parse(MAX_DATETIME),
        // minDateTime: DateTime.parse(MIN_DATETIME),
        initialDateTime: DateTime.parse('2020-01-01 18:26:59'),
        // 支持DateTimePickerMode.date、DateTimePickerMode.datetime、DateTimePickerMode.time
        pickerMode: BrnDateTimePickerMode.date,
        minuteDivider: 30,
        pickerTitleConfig: BrnPickerTitleConfig.Default,
        dateFormat: "yy-mm-dd", onConfirm: (dateTime, list) {
          BrnToast.show("onConfirm:  $dateTime   $list", context);
        },
        onClose: () {
          print("onClose");
        },
        onCancel: () {
          print("onCancel");
        },
        onChange: (dateTime, list) {
          print("onChange:  $dateTime    $list");
        });
  }

  _brnDateRangePicker(BuildContext context) {}

  _brnMultiDataPicker(BuildContext context) {}

  _brnMultiColumnPicker(BuildContext context) {}

  _brnMultiSelectListPicker(BuildContext context) {}

  _brnMultiSelectTagsPicker(BuildContext context) {}

  _brnSelectTagsWithInputPicker(BuildContext context) {}
}

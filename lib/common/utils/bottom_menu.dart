import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/widgets/common_edit_bottom_dialog.dart';

listBottomMenu(BuildContext context) {
  return [
    commonButton(
        content: "showModalBottomSheet",
        des: "显示一个底部弹出列表",
        onTop: () {
          _showModalBottomSheet(context);
        }),
    commonButton(
        content: "BrnCommonActionSheet",
        des: "底部弹出选项列表",
        onTop: () {
          _brnCommonActionSheet(context);
        }),
    commonButton(
        content: "BrnShareActionSheet",
        des: "底部弹出分享菜单",
        onTop: () {
          _brnShareActionSheet(context);
        }),
    commonButton(
        content: "BrnEditActionSheet",
        des: "底部弹出编辑框",
        onTop: () {
          CommonEditBottomDialog(
            onConfirmCallBack: (value)=>{},
            onCancelCallBack: ()=>{},
            title: "标题",
          ).show(context);
        }),
    commonButton(
        content: "BrnBottomPicker",
        des: "自定义的从底部弹出的 picker 框，支持高度的自定义（内容、头部）。解决了 picker 中有输入框，键盘遮挡等问题",
        onTop: () {
          BrnBottomPicker.show(context,
              barrierDismissible: false,
              contentWidget: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '键盘抬起，不遮挡picker',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(hintText: '请输入'),
                  )
                ],
              ));
        }),

    commonButton(
        content: "BrnBottomWritePicker",
        des: "从底部弹出带输入框的 Picker",
        onTop: () {
          BrnBottomWritePicker.show(context,  title: '写跟进',
            hintText: '请输入',
            confirmDismiss: true,
            onConfirm: (context, string) {
              // return;
            },
            onCancel: (_){

            },
            defaultText: '',);
        }),

    commonButton(
        content: "BrnDatePicker",
        des: "可用于页面底部弹出选择【单个】时间点的情况",
        onTop: () {
          BrnDatePicker.showDatePicker(context,
              // initialDateTime: DateTime.parse('2020-01-01 18:26:59'),
              // 支持DateTimePickerMode.date、DateTimePickerMode.datetime、DateTimePickerMode.time
              // pickerMode: BrnDateTimePickerMode.date,
              // minuteDivider: 30,
              // pickerTitleConfig: BrnPickerTitleConfig.Default,
              // dateFormat: BrnIntl.of(context).localizedResource.dateFormate_yyyy_MM_dd,
              onConfirm: (dateTime, list) {
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
        }),

    commonButton(
        content: "BrnDatePicker",
        des: "可用于页面底部弹出选择【单个】时间点的情况",
        onTop: () {

        }),
  ];
}

Future<void> _brnShareActionSheet(BuildContext context) async{
  List<BrnShareItem> firstRowList = [];
  List<BrnShareItem> secondRowList = [];
  firstRowList.add(BrnShareItem(
    BrnShareItemConstants.shareQZone,
    canClick: true,
  ));
  firstRowList.add(BrnShareItem(
    BrnShareItemConstants.shareSaveImage,
    canClick: true,
  ));
  firstRowList.add(BrnShareItem(
    BrnShareItemConstants.shareSms,
    canClick: true,
  ));
  firstRowList.add(BrnShareItem(
    BrnShareItemConstants.shareWeiBo,
    canClick: true,
  ));
  secondRowList.add(BrnShareItem(
    BrnShareItemConstants.shareQZone,
    canClick: false,
  ));
  secondRowList.add(BrnShareItem(
    BrnShareItemConstants.shareSaveImage,
    canClick: false,
  ));
  secondRowList.add(BrnShareItem(
    BrnShareItemConstants.shareSms,
    canClick: false,
  ));
  secondRowList.add(BrnShareItem(
    BrnShareItemConstants.shareWeiBo,
    canClick: false,
  ));
  BrnShareActionSheet actionSheet = new BrnShareActionSheet(
    firstShareChannels: firstRowList,
    secondShareChannels: secondRowList,
    clickCallBack: (int section, int index, BrnShareItem shareItem) {
      int channel = shareItem.shareType;
      BrnToast.show("channel: $channel, section: $section, index: $index", context);
    },
    clickInterceptor: (int section, int index, BrnShareItem shareItem) {
      if (shareItem.canClick) {
        return false;
      } else {
        BrnToast.show("不可点击，拦截了", context);
        return true;
      }
    },
  );
  actionSheet.show(context);
}

/// https://bruno.ke.com/page/v2.2.0/widgets/brn-common-action-sheet
Future<void> _brnCommonActionSheet(BuildContext context) async{
  List<BrnCommonActionSheetItem> actions = [];
  actions.add(
    BrnCommonActionSheetItem(
      '选项一: 自定义主标题样式',
      desc: '辅助信息默认样式',
      titleStyle: TextStyle(
        fontSize: 18,
        color: Color(0xFF123984),
      ),
    ),
  );
  actions.add(
    BrnCommonActionSheetItem(
      '选项二: 自定义辅助信息样式',
      desc: '自定义辅助信息样式',
      descStyle: TextStyle(
        fontSize: 14,
        color: Color(0xFF129834),
      ),
    ),
  );
  actions.add(
    BrnCommonActionSheetItem(
      '选项三: 自定义拦截点击事件，点击无效',
      desc: '辅助信息',
      titleStyle: TextStyle(
        fontSize: 16,
        color: Color(0xFF999999),
      ),
      descStyle: TextStyle(
        fontSize: 14,
        color: Color(0xFF999999),
      ),
    ),
  );

// 展示actionSheet
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return BrnCommonActionSheet(
          title: "自定义点击拦截事件，选项三点击不反回，其他选项点击事件正常，并且自定义标题最大行数为3行，超出会截断会截断会截断",
          actions: actions,
          maxTitleLines: 3,
          clickCallBack: (
              int index,
              BrnCommonActionSheetItem actionEle,
              ) {
            String title = actionEle.title;
            BrnToast.show("title: $title, index: $index", context);
          },
          onItemClickInterceptor: (
              int index,
              BrnCommonActionSheetItem actionEle,
              ) {
            // 选项三点击事件被拦截，不作处理
            if (index == 2) {
              BrnToast.show("被拦截了", context);
              return true;
            }
            // 其他选项正常
            return false;
          },
        );
      });
}

/// 显示一个底部列表
Future<void> _showModalBottomSheet(BuildContext context) async{
  showModalBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("$index"),
            onTap: () => Navigator.of(context).pop(index),
          );
        },
      );
    },
  );
}
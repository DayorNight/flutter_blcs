import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/weiget_util.dart';

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
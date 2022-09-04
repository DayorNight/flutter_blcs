import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blcs/common/weiget_util.dart';

/// Dialog
List<Widget> listDialog(BuildContext context) {
  return [
    commonButton(
        content: "showDialog",
        des: "显示一个Material对话框",
        onTop: () {
          _showDialog(context);
        }),
    commonButton(
        content: "Dialog",
        des: "显示一个Dialog对话框",
        onTop: () {
          _dialog(context);
        }),
    commonButton(
        content: "AlertDialog",
        des: "显示一个AlertDialog对话框",
        onTop: () {
          _alertDialog(context);
        }),
    commonButton(
        content: "SimpleDialog",
        des: "显示一个SimpleDialog对话框",
        onTop: () {
          _simpleDialog(context);
        }),
    commonButton(
        content: "BrnDialog",
        des: "显示一个文本",
        onTop: () {
          _brnDialog(context);
        }),
    commonButton(
        content: "showConfirmDialog",
        des: "icon+标题+信息+按钮",
        onTop: () {
          _showConfirmDialog(context);
        }),
    commonButton(
        content: "showSingleButtonDialog",
        des: "icon+标题+信息+警示+按钮",
        onTop: () {
          _showSingleButtonDialog(context);
        }),
    commonButton(
        content: "showMoreButtonDialog",
        des: "选项弹窗：标题+信息+选项菜单",
        onTop: () {
          _showMoreButtonDialog(context);
        }),
    commonButton(
        content: "BrnEnhanceOperationDialog",
        des: "双按钮弹窗：提示图标+主标题+辅助信息+双按钮",
        onTop: () {
          _brnEnhanceOperationDialog(context);
        }),
    commonButton(
        content: "BrnMiddleInputDialog",
        des: "带输入框的弹窗",
        onTop: () {
          _brnMiddleInputDialog(context);
        }),
    commonButton(
        content: "BrnMultiSelectDialog",
        des: "多选列表弹窗",
        onTop: () {
          _brnMultiSelectDialog(context);
        }),
    commonButton(
        content: "BrnScrollableTextDialog",
        des: "纯文本 Dialog 超过定高可滚动",
        onTop: () {
          _brnScrollableTextDialog(context);
        }),
    commonButton(
        content: "BrnShareDialog",
        des: "分享专用 Dialog",
        onTop: () {
          _brnShareDialog(context);
        }),
    commonButton(
        content: "BrnSingleSelectDialog",
        des: "适用于单选弹窗列表",
        onTop: () {
          _brnSingleSelectDialog(context);
        }),
  ];
}

///适用于单选弹窗列表 https://bruno.ke.com/page/v2.2.0/widgets/brn-single-select-dialog
Future<void> _brnSingleSelectDialog(BuildContext context) async{
  String hintText = "感兴趣待跟进";
  int selectedIndex = 0;
  var conditions = [
    "感兴趣待跟进",
    "感兴趣但不对本商圈没兴趣",
    "未接通",
    "接通",
    "号码错误",
    "dasdasda",
    "asdasfdg",
    "dadsadvq",
    "vzxczxc"
  ];
  showDialog(
      context: context,
      builder: (_) => StatefulBuilder(
        builder: (context, state) {
          return BrnSingleSelectDialog(
              isClose: true,
              title: '请选择无效客源原因',
              messageText: '请您评价该条线索请您评价该条线索请您评价该条线索请您评价该条线索请您评价该条线索',
              conditions: conditions,
              checkedItem: conditions[selectedIndex],
              submitText: '提交',
              isCustomFollowScroll: true,
              customWidget: TextField(
                //光标颜色
                maxLines: 2,
                cursorColor: Color(0xFF0984F9),
                //光标圆角弧度
                cursorRadius: Radius.circular(2.0),
                style: TextStyle(fontSize: 14, color: Color(0xFF222222)),
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                onChanged: (value) {},
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(8.0),
                  hintText: hintText,
                  hintStyle:
                  TextStyle(fontSize: 14, color: Color(0xFFCCCCCC)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0),
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Color(0xFFCCCCCC),
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(2.0),
                      borderSide: BorderSide(
                        width: 0.5,
                        color: Color(0xFFCCCCCC),
                      )),
                ),
              ),
              onItemClick: (BuildContext context, int index) {
                hintText = conditions[index];
                selectedIndex = index;
                state(() {});
              },
              onSubmitClick: (data) {
                BrnToast.show(data!, context);
              });
        },
      ));
}

/// 分享专用 Dialog https://bruno.ke.com/page/v2.2.0/widgets/brn-share-dialog
Future<void> _brnShareDialog(BuildContext context) async{
  BrnShareDialog brnShareDialog = new BrnShareDialog(
    context: context,
    shareChannels: [
      BrnShareItemConstants.shareWeiXin,
      BrnShareItemConstants.shareCustom,
      BrnShareItemConstants.shareCustom,
      BrnShareItemConstants.shareLink,
      BrnShareItemConstants.shareCustom
    ],
    titleText: "测试标题",
    descText: "测试辅助信息测试辅助信息测试辅助信息测试辅助信息测试辅助信息",
    clickCallBack: (int channel, int index) {
      BrnToast.show("channel: $channel, index: $index", context);
    },
    getCustomChannelWidget: (int index) {
      if (index == 1)
        return BrunoTools.getAssetImage("images/icon_custom_share.png");
      else if (index == 2)
        return BrunoTools.getAssetImage("images/icon_custom_share.png");
      else if (index == 4)
        return BrunoTools.getAssetImage("images/icon_custom_share.png");
      else
        return null;
    },
    // 自定义图标
    getCustomChannelTitle: (int index) {
      if (index == 1)
        return "自定义";
      else if (index == 2)
        return "自定义";
      else if (index == 4)
        return "自定义";
      else
        return null;
    }, // 自定义名字
  );
  brnShareDialog.show();
}

///纯文本 Dialog 超过定高可滚动 https://bruno.ke.com/page/v2.2.0/widgets/brn-scrollable-text-dialog
Future<void>  _brnScrollableTextDialog(BuildContext context) async{
  showDialog(
      context: context,
      builder: (_) => BrnScrollableTextDialog(
          title: "纯文本标题",
          contentText:
          "纯本文呢表纯本文呢表\<font color = '#008886'\>纯本文呢呢表纯\</font\>本文呢表纯本文呢表纯本文呢表纯本文\<a href='www.baidu.com'\>XXXXX\</a\>纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文"
              "呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯"
              "本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢"
              "表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表"
              "纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢"
              "表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文"
              "呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本"
              "文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢"
              "呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本"
              "文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文"
              "呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表纯本文呢表",
          submitText: "提交",
          linksCallback: (String? text, String? url) {
            BrnToast.show(text!, context);
          },
          onSubmitClick: () {
            BrnToast.show("点击了纯文本弹框", context);
          }));
}

/// 带输入框的弹窗 https://bruno.ke.com/page/v2.2.0/widgets/brn-multi-select-dialog
Future<void> _brnMultiSelectDialog(BuildContext context) async {
  String hintText = "感兴趣待跟进";
  List<MultiSelectItem> data = [];
  data.add(new MultiSelectItem("100", "感兴趣待跟进"));
  data.add(new MultiSelectItem("101", "感兴趣但对本商圈没兴趣", isChecked: true));
  data.add(new MultiSelectItem("102", "接通后挂断/不感兴趣", isChecked: true));
  data.add(new MultiSelectItem("102", "接通后挂断/不感兴趣", isChecked: true));
  data.add(new MultiSelectItem("103", "未接通"));
  data.add(new MultiSelectItem("103", "未接通"));
  data.add(new MultiSelectItem("104", "其他"));
  showDialog(
      context: context,
      builder: (_) => StatefulBuilder(builder: (context, state) {
        return BrnMultiSelectDialog(
            title: "请您评价该条线索Widget",
            messageWidget: Row(
              children: <Widget>[
                Text(
                  "选择放弃原因（多选）",
                  style: cContentTextStyle,
                ),
              ],
            ),
            isClose: true,
            conditions: data,
            isCustomFollowScroll: false,
            customWidget: TextField(
              //光标颜色
              maxLines: 2,
              cursorColor: Color(0xFF0984F9),
              //光标圆角弧度
              cursorRadius: Radius.circular(2.0),
              style: TextStyle(fontSize: 14, color: Color(0xFF222222)),
              maxLengthEnforced: true,
              onChanged: (value) {},
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8.0),
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 14, color: Color(0xFFCCCCCC)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2.0),
                    borderSide: BorderSide(
                      width: 0.5,
                      color: Color(0xFFCCCCCC),
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2.0),
                    borderSide: BorderSide(
                      width: 0.5,
                      color: Color(0xFFCCCCCC),
                    )),
              ),
            ),
            onItemClick: (BuildContext contex, int index) {
              hintText = data[index].content;
              state(() {});
            },
            onSubmitClick: (List<MultiSelectItem> data) {
              var str = "";
              data.forEach((item) {
                str = str + item.content + "  ";
              });
              BrnToast.show(str, context);
              return true;
            });
      }));
}

/// 带输入框的弹窗
Future<void> _brnMiddleInputDialog(BuildContext context) async {
  BrnMiddleInputDialog(
      title: '拒绝理由 dismissOnActionsTap 点击Action不消失',
      message: "仅可输入数字。辅助内容辅助内容辅助内容辅助内容辅助内容辅助内容辅助内容辅助内容辅助内容 ",
      hintText: '提示信息',
      cancelText: '取消',
      confirmText: '确定',
      autoFocus: true,
      maxLength: 1000,
      maxLines: 2,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      dismissOnActionsTap: false,
      barrierDismissible: true,
      onConfirm: (value) {
        BrnToast.show(value, context);
      },
      onCancel: () {
        BrnToast.show("取消", context);
        Navigator.pop(context);
      }).show(context);
}

/// 双按钮弹窗：提示图标+主标题+辅助信息+双按钮
Future<void> _brnEnhanceOperationDialog(BuildContext context) async {
  BrnEnhanceOperationDialog(
    context: context,
    iconType: BrnDialogConstants.iconAlert,
    titleText: "强提示文案",
    descText: "这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案这里是文案",
    mainButtonText: "主要按钮",
    secondaryButtonText: "次要信息可点击",
    onMainButtonClick: () {
      print("主要按钮");
    },
    onSecondaryButtonClick: () {
      print("次要按钮");
    },
  ).show();
}

/// 标题+信息+按钮 弹窗
Future<void> _showConfirmDialog(BuildContext context) async {
  return BrnDialogManager.showConfirmDialog(context,
      cancel: "取消",
      confirm: "确定",
      title: "标题",
      message: "辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息",
      messageWidget: Padding(
        padding: const EdgeInsets.only(top: 6, left: 24, right: 24),
        child: BrnCSS2Text.toTextView(
            "这是一条增使用标签修改文字颜色的demo\<font color = '#8ac6d1'\>我是带颜色的文字</font>，"
                "这是颜色标签后边的文字",
            linksCallback: (String? text, String? linkUrl) {
              BrnToast.show('$text clicked!  Url is $linkUrl', context);
            }),
      ),
      onCancel: (){
        Navigator.of(context).pop();
      },
      showIcon: true, onConfirm: () {
        BrnToast.show("确定", context);
        Navigator.of(context).pop();
      });
}

/// 选项弹窗
Future<void> _showMoreButtonDialog(BuildContext context) async {
  return BrnDialogManager.showMoreButtonDialog(context,
      title: "标题内容",
      actions: [
        '选项一',
        '选项二',
        '选项三',
      ],
      message: "辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息。",
      indexedActionClickCallback: (index) {
        BrnToast.show("$index", context);
        Navigator.of(context).pop();
      });
}

/// 当前内容上方显示一个Material对话框
Future<void> _showDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, //点击背景部分是否关闭弹窗
    barrierColor: Colors.black26, //背景颜色
    builder: (BuildContext context) {
      return Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('显示一个按钮'),
        ),
      );
    },
  );
}

/// showDialog + Dialog
/// 实际上AlertDialog和SimpleDialog都使用了Dialog类。由于AlertDialog和SimpleDialog中使用了IntrinsicWidth来尝试通过子组件的实际尺寸来调整自身尺寸，这就导致他们的子组件不能是延迟加载模型的组件（如ListView、GridView 、 CustomScrollView等）
Future<void> _dialog(BuildContext context) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          child: Column(
            children: [
              ListTile(title: Text("请选择")),
              Expanded(
                  child: ListView.builder(
                    itemCount: 30,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text("$index"),
                        onTap: () => Navigator.of(context).pop(index),
                      );
                    },
                  )),
            ],
          ),
        );
      });
}

/// showDialog + AlertDialog
Future<void> _alertDialog(BuildContext context) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("标题"),
          content: const Text("内容"),
          actions: [
            TextButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("确定"),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      });
}

/// showDialog + SimpleDialog
Future<void> _simpleDialog(BuildContext context) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('标题'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Treasury department'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('State department'),
            ),
          ],
        );
      });
}

///https://bruno.ke.com/page/v2.2.0/widgets/brn-dialog
Future<void> _brnDialog(BuildContext context) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return BrnDialog(
          messageText: "辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息",
          actionsText: [],
        );
      });
}

///显示 标题+信息+警示+按钮
_showSingleButtonDialog(BuildContext context) async {
  return BrnDialogManager.showSingleButtonDialog(context,
      label: "确定",
      title: '标题内容',
      warning: '错误文案展示/警示文案展示',
      message: "辅助内容信息辅助内容信息辅助内容信息辅助内容信息辅助内容信息。", onTap: () {
        BrnToast.show('知道了', context);
        Navigator.of(context).pop();
      });
}
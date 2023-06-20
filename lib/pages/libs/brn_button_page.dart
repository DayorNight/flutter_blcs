import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/BasePageWidget.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/generated/l10n.dart';

class BrnButtonPage extends BasePageWidget {
  static const keys = 'BrnButtonPage';
  @override
  Widget buildBody(BuildContext context) {
    return ListView(
      children: [
        commonButton(content: 'BrnButtonPanel', des: '主次按钮组成的横向按钮交互面板'),
        buttonPanel(context),
        commonButton(content: 'BrnTextButtonPanel', des: '多个文字按钮组成的按钮集合'),
        textButtionPanel(context),
        commonButton(content: 'BrnIconButton', des: '支持图片和文字任意组合'),
        iconButton(context),


      ],
    );
  }

  Widget buttonPanel(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('只有主按钮'),
        BrnButtonPanel(
          mainButtonName: '主按钮',
          mainButtonOnTap: () {
            BrnToast.show('主按钮点击', context);
          },
          secondaryButtonOnTap: (index) {
            BrnToast.show('第$index个次按钮点击了', context);
          },
        ),
        Text('主按钮和一个次按钮'),

        BrnButtonPanel(
          mainButtonName: '主按钮',
          mainButtonOnTap: () {
            BrnToast.show('主按钮点击', context);
          },
          secondaryButtonNameList: ['次按钮1'],
          secondaryButtonOnTap: (index) {
            BrnToast.show('第$index个次按钮点击了', context);
          },
        ),
        Text('主按钮和两个次按钮'),
        BrnButtonPanel(
          mainButtonName: '主按钮',
          mainButtonOnTap: () {
            BrnToast.show('主按钮点击', context);
          },
          secondaryButtonNameList: ['次按钮1', '次按钮2'],
          secondaryButtonOnTap: (index) {
            BrnToast.show('第$index个次按钮点击了', context);
          },
        ),

        Text('含有不可用的次按钮'),
        BrnButtonPanel(
          mainButtonName: '主按钮',
          mainButtonOnTap: () {
            BrnToast.show('主按钮点击', context);
          },
          secondaryButtonList: [
            BrnButtonPanelConfig(name: '次按钮1', isEnable: false),
            BrnButtonPanelConfig(name: '次按钮2', isEnable: true)
          ],
          secondaryButtonOnTap: (index) {
            BrnToast.show('第$index个次按钮点击了', context);
          },
        ),
        Text('向下弹出更多按钮'),
        BrnButtonPanel(
          mainButtonName: '主按钮',
          mainButtonOnTap: () {
            BrnToast.show('主按钮点击', context);
          },
          secondaryButtonList: [
            BrnButtonPanelConfig(name: '次按钮1', isEnable: true),
            BrnButtonPanelConfig(name: '次按钮2', isEnable: true),
            BrnButtonPanelConfig(name: '次按钮3', isEnable: true),
            BrnButtonPanelConfig(name: '次按钮4', isEnable: true),
            BrnButtonPanelConfig(name: '次按钮5', isEnable: true),
          ],
          secondaryButtonOnTap: (index) {
            BrnToast.show('第$index个次按钮点击了', context);
          },
        ),
      ],
    );
  }

  Widget iconButton(BuildContext context){
    return Row(
      children: <Widget>[
        Center(
          child: BrnIconButton(
              name: '文字在下',
              style: TextStyle(
                fontSize: 18,
                color: Colors.indigo,
              ),
              direction: Direction.bottom,
              iconWidget: Icon(Icons.arrow_upward),
              onTap: () {
                BrnToast.show('按钮被点击', context);
              }),
        ),
        Center(
          child: BrnIconButton(
              name: '文字在上',
              direction: Direction.top,
              padding: 4,
              iconWidget: Icon(Icons.assignment),
              onTap: () {
                BrnToast.show('按钮被点击', context);
              }),
        ),
        Center(
          child: BrnIconButton(
              name: '文字在右',
              direction: Direction.right,
              padding: 4,
              iconWidget: Icon(Icons.autorenew),
              onTap: () {
                BrnToast.show('按钮被点击', context);
              }),
        ),
        Center(
          child: BrnIconButton(
              name: '文字在左',
              direction: Direction.left,
              padding: 4,
              iconWidget: Icon(Icons.backspace),
              onTap: () {
                BrnToast.show('按钮被点击', context);
              }),
        )
      ],

    );
  }

  @override
  String? get getTitle => S.current.button_title;

  @override
  String? get getKeys => keys;

  Widget textButtionPanel(BuildContext context) {
    return Column(
      children: [
        Text('一个按钮'),
        BrnTextButtonPanel(
          nameList: ['操作1'],
          onTap: (index) {
            BrnToast.show('第$index个操作', context);
          },
        ),
        Text('四个按钮'),
        BrnTextButtonPanel(
          nameList: ['操作1', '操作2', '操作3', '操作4'],
          onTap: (index) {
            BrnToast.show('第$index个操作', context);
          },
        ),
        Text('按钮文本过长'),
        BrnTextButtonPanel(
          nameList: ['操作1操作1操作1操作1操作1操作1操作1操作1', '操作2', '操作3'],
          onTap: (index) {
            BrnToast.show('第$index个操作', context);
          },
        ),
        Text('更多弹窗'),
        BrnTextButtonPanel(
          nameList: ['操作1', '操作2', '操作3', '操作4', '操作5', '操作6'],
          popDirection: BrnPopupDirection.top,
          onTap: (index) {
            BrnToast.show('第$index个操作', context);
          },
        ),
      ],
    );
  }
}

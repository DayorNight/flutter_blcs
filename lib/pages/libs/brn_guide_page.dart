import 'dart:async';

import 'package:bruno/bruno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/BasePageWidget.dart';
import 'package:flutter_blcs/common/utils/navigator.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/generated/l10n.dart';

class BrnGuidePage extends BasePageWidget {
  static const keys = 'BrnGuidePage';
  @override
  String? get getKeys => keys;

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        commonButton(content: 'BrnGuide', des: '强引导',onTop: (){
          NavigatorUtils.toClass(context, ForceGuideDemo());
        }),
        commonButton(content: 'BrnGuide', des: '弱引导',onTop: (){
          NavigatorUtils.toClass(context, SoftGuideDemo());
        }),
      ],
    );
  }


  @override
  String? get getTitle => S.current.guide_title;


}

class ForceGuideDemo extends StatefulWidget {
  ForceGuideDemo({Key? key}) : super(key: key);

  @override
  _ForceGuideDemoState createState() => _ForceGuideDemoState();
}

class _ForceGuideDemoState extends State<ForceGuideDemo> {
  late BrnGuide intro;

  _ForceGuideDemoState() {
    /// init Guide
    intro = BrnGuide(
      stepCount: 7,
      introMode: GuideMode.force,

      /// use defaultTheme, or you can implement widgetBuilder function yourself
      widgetBuilder: StepWidgetBuilder.useDefaultTheme(
        showClose: false,
        tipInfo: [
          BrnTipInfoBean("标题栏", "这里是标题栏，显示当前页面的名称", ""),
          BrnTipInfoBean("标签组件", "这里是标签组件，你可以动态添加或者删除组件，当你点击后会将结果给你回传", ""),
          BrnTipInfoBean("左边的按钮", "这里是按钮，点击他试试", ''),
          BrnTipInfoBean("右边的按钮", "这里是按钮，点击他试试", ''),
          BrnTipInfoBean("左边的文本 ", "这是一个朴实无华的文本", ''),
          BrnTipInfoBean("右边文本 ", "这是一个枯燥文本", ""),
          BrnTipInfoBean("开始按钮 ", "点击开启引导动画", ''),
        ],
      ),
    );
  }

  List<String> nameList = [
    '这是一条很长很长很长很长很长很长很长很长很长很长的标签',
    '标签么么么么么',
    '标签么么没没没么么么',
    '标签么么么么么',
    '标签么么么么么'
  ];

  @override
  void initState() {
    super.initState();
    Timer(Duration(microseconds: 0), () {
      /// start the intro
      intro.start(context);
    });
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: BrnAppBar(
          brightness: Brightness.light,
          title: Text(
            '强引导组件demo',
            key: intro.keys[0],
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BrnSelectTagWidget',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '流式布局的自适应标签(最小宽度75)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                BrnSelectTag(
                    key: intro.keys[1],
                    tags: nameList,
                    tagWidth: (MediaQuery.of(context).size.width - 40 - 24) / 3,
                    fixWidthMode: false,
                    onSelect: (index) {
                      BrnToast.show("$index is selected", context);
                    }),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      key: intro.keys[2],
                      onPressed: () {},
                      child: Text("需求1"),
                    ),
                    TextButton(
                      key: intro.keys[3],
                      onPressed: () {},
                      child: Text("需求2"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 14,
                      padding: EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      child: Text(
                        '左边的文字',
                        key: intro.keys[4],
                      ),
                    ),
                    Container(
                      width: 14,
                      padding: EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      child: Text(
                        '右边的文字',
                        key: intro.keys[5],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          key: intro.keys[6],

          /// 1st guide
          child: Icon(
            Icons.play_arrow,
          ),
          onPressed: () {
            intro.start(context);
          },
        ),
      ),
      onWillPop: () async {
        // destroy guide page when tap back key
        intro.dispose();
        return true;
      },
    );
  }
}

class SoftGuideDemo extends StatefulWidget {
  SoftGuideDemo({Key? key}) : super(key: key);

  @override
  _SoftGuideDemoState createState() => _SoftGuideDemoState();
}

class _SoftGuideDemoState extends State<SoftGuideDemo> {
  late BrnGuide intro;

  _SoftGuideDemoState() {
    /// init Guide
    intro = BrnGuide(
      stepCount: 7,
      introMode: GuideMode.soft,

      /// use defaultTheme, or you can implement widgetBuilder function yourself
      widgetBuilder: StepWidgetBuilder.useDefaultTheme(
        tipInfo: [
          BrnTipInfoBean("标题栏", "这里是标题栏，显示当前页面的名称", ""),
          BrnTipInfoBean("标签组件", "这里是标签组件，你可以动态添加或者删除组件，当你点击后会将结果给你回传", ""),
          BrnTipInfoBean("左边的按钮", "这里是按钮，点击他试试", ""),
          BrnTipInfoBean("右边的按钮", "这里是按钮，点击他试试", ""),
          BrnTipInfoBean("左边的文本 ", "这是一个朴实无华的文本", ""),
          BrnTipInfoBean("右边文本 ", "这是一个枯燥文本", ""),
          BrnTipInfoBean("开始按钮 ", "点击开启引导动画", ""),
        ],
      ),
    );
  }

  List<String> nameList = [
    '这是一条很长很长很长很长很长很长很长很长很长很长的标签',
    '标签么么么么么',
    '标签么么没没没么么么',
    '标签么么么么么',
    '标签么么么么么'
  ];

  @override
  void initState() {
    super.initState();
    Timer(Duration(microseconds: 0), () {
      /// start the intro
      intro.start(context);
    });
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: BrnAppBar(
          brightness: Brightness.light,
          title: Text(
            '弱引导组件demo',
            key: intro.keys[0],
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BrnSelectTagWidget',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '流式布局的自适应标签(最小宽度75)',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                BrnSelectTag(
                    key: intro.keys[1],
                    tags: nameList,
                    tagWidth: (MediaQuery.of(context).size.width - 40 - 24) / 3,
                    fixWidthMode: false,
                    onSelect: (index) {
                      BrnToast.show("$index is selected", context);
                    }),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      key: intro.keys[2],
                      onPressed: () {},
                      child: Text("需求1"),
                    ),
                    TextButton(
                      key: intro.keys[3],
                      onPressed: () {},
                      child: Text("需求2"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 14,
                      padding: EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      child: Text(
                        '左边的文字',
                        key: intro.keys[4],
                      ),
                    ),
                    Container(
                      width: 14,
                      padding: EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      child: Text(
                        '右边的文字',
                        key: intro.keys[5],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          key: intro.keys[6],

          /// 1st guide
          child: Icon(
            Icons.play_arrow,
          ),
          onPressed: () {
            intro.start(context);
          },
        ),
      ),
      onWillPop: () async {
        // destroy guide page when tap back key
        intro.dispose();
        return true;
      },
    );
  }
}

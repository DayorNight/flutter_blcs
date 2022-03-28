import 'package:flutter/material.dart';
import '../common/weiget_util.dart';

///文章模板
class ArticleModel extends StatelessWidget {
  final String title; //标题
  final String keys; //标题
  final Color logoColor; //logo颜色
  final String des; //文本
  final String code; //代码码
  final Widget? footerChild;
  final Widget? headerChild;

  const ArticleModel(
      {Key? key,
      required this.title,
      required this.keys,
      required this.logoColor,
      required this.des,
      required this.code,
      this.headerChild,
      this.footerChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context,title),
      body: Stack(
        children: [
          articleLogo(keys, logoColor),
          ListView(
            padding: EdgeInsets.all(10),
            children: [
              headerChild ?? SizedBox(),
              printTxt(des),
              printCode(code),
              footerChild ?? SizedBox()
            ],
          )
        ],
      ),
    );
  }
}

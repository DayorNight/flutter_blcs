import 'package:flutter/material.dart';
import '../common/weiget_util.dart';

///文章模板
class ArticleModel extends StatelessWidget {
  final String title; //标题
  final String keys; //标题
  final Color logoColor; //logo颜色
  final String? des; //文本
  final String? code; //代码码
  final Widget? footerChild;
  final Widget? headerChild;
  final Widget? buidlBody;

  const ArticleModel(
      {Key? key,
      required this.title,
      required this.keys,
      required this.logoColor,
      this.des,
      this.code,
      this.headerChild,
      this.buidlBody,
      this.footerChild})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, title),
      body: Stack(
        children: [
          buildBody(),
          articleLogo(keys, logoColor),
        ],
      ),
    );
  }

  Widget buildBody(){
    if(buidlBody==null){
     return ListView(
        padding: EdgeInsets.all(10),
        children: [
          headerChild ?? SizedBox(),
          if (des != null) printTxt(des!),
          if (code != null) printCode(code!),
          footerChild ?? SizedBox()
        ],
      );
    }else{
     return buidlBody ?? SizedBox();
    }
  }
}

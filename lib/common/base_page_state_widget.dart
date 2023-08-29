import 'package:flutter/material.dart';
import 'package:flutter_blcs/widgets/article_model.dart';

abstract class BasePageStateWidget extends StatefulWidget {
  final String? getKeys;

  final String? getTitle;

  ///描述
  final String? getDes;

  ///代码
  final String? getCode;

  const BasePageStateWidget({Key? key,this.getKeys, this.getTitle, this.getDes, this.getCode}) : super(key: key);

  @override
  State<BasePageStateWidget> createState() => BasePageStateWidgetState();

  ///头部插入
  Widget? buildHeaderBody(BuildContext context) {
    return null;
  }

  ///尾部插入
  Widget? buildFooterBody(BuildContext context) {
    return null;
  }

  Widget? buildBody(BuildContext context) {
    return null;
  }

  void initState() {
  }

  void dispose() {
  }

  void initStateTicker(TickerProvider vsync) {}

}

class BasePageStateWidgetState extends State<BasePageStateWidget>  with SingleTickerProviderStateMixin{

  @override
  void initState() {
    super.initState();
    widget.initState();
    widget.initStateTicker(this);
  }


  @override
  void dispose() {
    super.dispose();
    widget.dispose();
  }


  @override
  Widget build(BuildContext context) {
    if(widget.getKeys == null){
      return widget.buildBody(context)??Text('keys is null');
    }
    return ArticleModel(
      title: widget.getTitle ?? runtimeType.toString(),
      keys: widget.getKeys ?? runtimeType.toString(),
      logoColor: Theme.of(context).primaryColor,
      des: widget.getDes,
      code: widget.getCode,
      headerChild: widget.buildHeaderBody(context),
      footerChild: widget.buildFooterBody(context),
      buidlBody: widget.buildBody(context),
    );
  }

}

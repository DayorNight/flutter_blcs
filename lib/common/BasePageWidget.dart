import 'package:flutter/material.dart';
import 'package:flutter_blcs/widgets/article_model.dart';

abstract class BasePageWidget extends StatelessWidget {
  const BasePageWidget(
      {super.key, this.getKeys, this.getTitle, this.getDes, this.getCode});

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: getTitle ?? runtimeType.toString(),
      keys: getKeys ?? runtimeType.toString(),
      logoColor: Theme.of(context).primaryColor,
      des: getDes,
      code: getCode,
      headerChild: buildHeaderBody(context),
      footerChild: buildFooterBody(context),
      buidlBody: buildBody(context),
    );
  }

  final String? getKeys;

  final String? getTitle;

  ///描述
  final String? getDes;

  ///代码
  final String? getCode;

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
}

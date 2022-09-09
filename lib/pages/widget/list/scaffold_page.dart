import 'package:flutter/material.dart';
import 'package:flutter_blcs/widgets/article_model.dart';

const String scaffoldPageCode=
'''

''';
class ScaffoldPage extends StatelessWidget {
  static final String keys = "ScaffoldPage";
  const ScaffoldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: 'ScaffoldPage',
      keys: keys,
      logoColor: Theme.of(context).primaryColor,
      des: "脚手架，实现页面的快速搭建",
      code: scaffoldPageCode,
    );
  }
}

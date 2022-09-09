import 'package:flutter/material.dart';
import 'package:flutter_blcs/widgets/article_model.dart';

class AppBarPage extends StatelessWidget {
  static final String keys = "AppBarPage";
  const AppBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: 'AppBarPage',
      keys: keys,
      logoColor: Theme.of(context).primaryColor,
      des: "11111",
    );
  }
}

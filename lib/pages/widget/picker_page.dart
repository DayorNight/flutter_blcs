import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/widgets/article_model.dart';


class PickerPage extends StatelessWidget {
  static final String keys = "PickerPage";

  const PickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: '按钮',
      keys: keys,
      logoColor: Theme.of(context).primaryColor,
      headerChild: Column(
        children: _listWidget(context),
      ),
    );
  }

  List<Widget> _listWidget(BuildContext context) {
    return [
      commonButton(content: "普通弹窗",des: "说明",onTop: (){}),
    ];
  }

}

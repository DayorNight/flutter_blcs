import 'package:flutter/material.dart';
import 'package:flutter_blcs/widgets/article_model.dart';
import '../../common/utils/code.dart';
import '../../generated/l10n.dart';

class NetWorkPage extends StatelessWidget {
  static const String keys = "NetWorkPage";
  const NetWorkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: S.of(context).netWork,
      keys: keys,
      logoColor: Theme.of(context).primaryColor,
      des: netWorkDes,
      code: netWorkCode,
    );
  }
}

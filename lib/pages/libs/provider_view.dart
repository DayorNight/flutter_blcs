import 'package:flutter/material.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/common/utils/code.dart';
import 'package:flutter_blcs/widgets/article_model.dart';

class ProviderView extends StatelessWidget {
  static final String keys = "providerView";

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: S.of(context).provider,
      keys: ProviderView.keys,
      logoColor: Theme.of(context).primaryColor,
      des: providerDes,
      code: providerCode,
    );
  }
}


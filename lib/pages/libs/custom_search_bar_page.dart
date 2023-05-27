import 'package:flutter/material.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/widgets/article_model.dart';
import 'package:flutter_blcs/widgets/custom_search_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBarPage extends StatelessWidget {
  static const keys = 'CustomSearchBarPage';
  const CustomSearchBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
      title: S.current.searchTitle,
      keys: CustomSearchBarPage.keys,
      logoColor: Theme.of(context).primaryColor,
      footerChild: Padding(padding: EdgeInsets.only(right: 0.3.sw),child: CustomSearchBarWidget()),
    );
  }
}

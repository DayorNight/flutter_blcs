import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/utils/code.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/widgets/article_model.dart';
import 'package:flutter_blcs/generated/l10n.dart';

class HeroView extends StatelessWidget {
  static final String keys = "heroView";

  const HeroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ArticleModel(
        title: S.of(context).heroView,
        keys: keys,
        logoColor: Theme.of(context).primaryColor,
        des: heroDes,
        code: heroCode,
        footerChild: GestureDetector(
          child: Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: 'hero',
                child: Icon(Icons.circle,size: 50),
              )
          ),
          onTap:() => _gotoDetailsPage(context) ,
        )
    );
  }

  void _gotoDetailsPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => Scaffold(
        body: Scaffold(
          appBar: getAppBar(S.of(context).heroView),
          body: Align(
              alignment: Alignment.center,
              child: Hero(
                  tag: 'hero',
                  child: Icon(Icons.circle,size: 150)
              )
          ),
        ),
      ),
    ));
  }
}

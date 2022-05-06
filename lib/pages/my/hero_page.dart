import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/utils/code.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/widgets/article_model.dart';
import 'package:flutter_blcs/generated/l10n.dart';

class HeroPage extends StatelessWidget {
  static final String keys = "HeroPage";

  const HeroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = S.of(context).hero;
    return ArticleModel(
        title: title,
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
          onTap:() => _gotoDetailsPage(context,title) ,
        )
    );
  }

  void _gotoDetailsPage(BuildContext context,String title) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => Scaffold(
        body: Scaffold(
          appBar: getAppBar(context,title),
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

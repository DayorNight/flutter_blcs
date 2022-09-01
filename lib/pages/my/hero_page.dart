import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/utils/code.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/widgets/article_model.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeroPage extends StatefulWidget {
  static final String keys = "HeroPage";
  const HeroPage({Key? key}) : super(key: key);

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage>{
  late Animation<double> animate;
  @override
  Widget build(BuildContext context) {
    var title = S.of(context).hero;
    return ArticleModel(
        title: title,
        keys: HeroPage.keys,
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
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context,animation,seAnimation) => Scaffold(
        body: Scaffold(
          appBar: getAppBar(context,title),
          body: Align(
              alignment: Alignment.center,
              child: Hero(
                tag: 'hero',
                child: Icon(Icons.circle,size: 150),
                transitionOnUserGestures: true,
                flightShuttleBuilder: (context, anim, direction, fromContext, toContext) {
                  final Hero toHero = toContext.widget as Hero;
                  if (direction == HeroFlightDirection.pop) {
                    return ScaleTransition(
                      scale:Tween(begin: 1.0,end: 2.0).animate(anim),
                      child: toHero.child,
                    );
                  } else {
                    return toHero.child;
                  }
                },
              )
          ),
        ),
      ),
      transitionDuration: Duration(milliseconds: 3000),
      reverseTransitionDuration:  Duration(milliseconds: 3000),
    ));
  }
}


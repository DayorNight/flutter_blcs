import 'package:flutter/material.dart';
import 'package:flutter_blcs/widgets/article_model.dart';
import '../../common/utils/code.dart';
import '../../generated/l10n.dart';
class RouteAnimationView extends StatefulWidget {
  static const String keys = 'routeAnimationView';
  const RouteAnimationView({Key? key}) : super(key: key);

  @override
  _RouteAnimationViewState createState() => _RouteAnimationViewState();
}

class _RouteAnimationViewState extends State<RouteAnimationView> {
  @override
  Widget build(BuildContext context) {
    return ArticleModel(title: S.of(context).animationView, keys: RouteAnimationView.keys, logoColor: Theme.of(context).primaryColor, des: AnimationDes, code: AnimationCode);
  }
}

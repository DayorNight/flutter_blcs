import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/base_page_state_widget.dart';
import 'package:flutter_blcs/common/utils/code.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/generated/l10n.dart';

class HeroPage extends BasePageStateWidget {
  static final String keys = "HeroPage";
  @override
  String? get getKeys => keys;

  @override
  String? get getTitle => S.current.hero;

  late Animation<double> animate;

  @override
  String? get getDes => heroDes;

  @override
  String? get getCode => heroCode;

  @override
  Widget? buildBody(BuildContext context) {
    return GestureDetector(
      child: Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: 'hero',
            child: Icon(Icons.circle,size: 50),
          )
      ),
      onTap:() => _gotoDetailsPage(context,S.current.hero) ,
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


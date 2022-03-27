import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/weiget_util.dart';

class DemoView extends StatefulWidget {
  static final String keys = "demoView";
  const DemoView({Key? key}) : super(key: key);

  @override
  _DemoViewState createState() => _DemoViewState();
}

class _DemoViewState extends State<DemoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: GestureDetector(
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
        body: Align(
            alignment: Alignment.bottomCenter,
            child: Hero(
              tag: 'hero',
              child: Icon(Icons.circle,size: 100)
            )
        ),
      ),
    ));
  }
}


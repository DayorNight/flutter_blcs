import 'package:flutter/material.dart';
import 'package:flutter_blcs/utils/weiget_util.dart';
/// UI 列表
class WeigetView extends StatefulWidget {
  const WeigetView({Key? key}) : super(key: key);

  @override
  _WeigetViewState createState() => _WeigetViewState();
}

class _WeigetViewState extends State<WeigetView> {
  var banners = ["Flutter","Kotlin","Android"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: 200,
        child: getBanner(banners),
      ),
    );
  }
}

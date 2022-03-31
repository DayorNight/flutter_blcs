import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/weiget_util.dart';

class DemoView extends StatefulWidget {
  static final String keys = "demoView";

  const DemoView({Key? key}) : super(key: key);

  @override
  _DemoViewState createState() => _DemoViewState();
}

class _DemoViewState extends State<DemoView>{
  String value = "默认路由方式";
  String value1 = "左右切换方式";
  String value2 = "PageRouteBuilder自定义方式";
  String value3 = "继承PageRoute自定义方式";
  String pages = '页面B';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('title'),
      body: TextButton(onPressed: (){
        throw ArgumentError('12312312');
      }, child: Text('data')),
    );
  }

}



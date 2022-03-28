import 'package:flutter/material.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/static.dart';
import '../common/weiget_util.dart';

class DemoView extends StatefulWidget {
  static final String keys = "demoView";

  const DemoView({Key? key}) : super(key: key);

  @override
  _DemoViewState createState() => _DemoViewState();
}

class _DemoViewState extends State<DemoView> {
  static const String keys = 'personalView';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          S.of(context).personalView,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
          SizedBox(
            width: 15.r,
          )
        ],
      ),
      body: Hero(
        tag: 'PersonalView',
        child: Center(
          child: Image(
            image: AssetImage(Images.logo),
            width: 750.r,
            height: 750.r,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}


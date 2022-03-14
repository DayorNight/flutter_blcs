import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_blcs/utils/weiget_util.dart';

/// UI 列表
class WeigetView extends StatefulWidget {
  const WeigetView({Key? key}) : super(key: key);

  @override
  _WeigetViewState createState() => _WeigetViewState();
}

class _WeigetViewState extends State<WeigetView> {
  var banners = ["Flutter", "Kotlin", "Android"];
  List _hor_weiget = [
    "Scaffold",
    "Scaffold",
    "Scaffold",
    "Scaffold",
    "Scaffold",
    "Scaffold",
    "Scaffold",
    "Scaffold"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          getBanner(banners),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,

            ),
            itemBuilder:(context,index){
              return Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Icon(Icons.android_rounded),
                    Text(_hor_weiget[index])
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

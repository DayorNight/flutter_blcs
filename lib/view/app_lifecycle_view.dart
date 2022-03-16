import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/utils/weiget_util.dart';

class AppLifecycleView extends StatefulWidget {
  const AppLifecycleView({Key? key}) : super(key: key);

  @override
  _AppLifecycleState createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycleView>
    with WidgetsBindingObserver {
  late S _s;

  @override
  void initState() {
    super.initState();
    print("initState");
    WidgetsBinding.instance?.addObserver(this);
  }

  List<String> _datas = [];

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    _datas.add("didChangeAppLifecycleState:");
    print("didChangeAppLifecycleState");
    if (state == AppLifecycleState.resumed) {
      _datas.add("resumed:");
      print("resumed");
    } else if (state == AppLifecycleState.inactive) {
      _datas.add("inactive:");
      print("inactive");
    } else if (state == AppLifecycleState.paused) {
      _datas.add("paused:");
      print("paused");
    } else if (state == AppLifecycleState.detached) {
      _datas.add("detached:");
      print("detached");
    }
  }

  @override
  Widget build(BuildContext context) {
    _s = S.of(context);
    return Scaffold(
      appBar: getAppBar(_s.app_lifeCycle),
      body: Container(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Text("data"),
          ),
          SliverFixedExtentList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Text(_datas[index]);
              }, childCount: _datas.length),
              itemExtent: 50)
        ],
      )),
    );
  }
}

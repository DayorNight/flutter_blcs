import 'package:flutter/material.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/common/utils/code.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

class AppLifecycleView extends StatefulWidget {
  const AppLifecycleView({Key? key}) : super(key: key);

  @override
  _AppLifecycleState createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycleView>
    with WidgetsBindingObserver {
  late S _s;
  String _state = "未获取到状态";


  @override
  void initState() {
    super.initState();
    ///监听生命周期
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    ///移除监听
   WidgetsBinding.instance?.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    setState(() {
      _state = state.name;
    });
    print("didChangeAppLifecycleState");
    if (state == AppLifecycleState.resumed) {
      print("resumed");
    } else if (state == AppLifecycleState.inactive) {
      print("inactive");
    } else if (state == AppLifecycleState.paused) {
      print("paused");
    } else if (state == AppLifecycleState.detached) {
      print("detached");
    }
  }

  @override
  Widget build(BuildContext context) {
    _s = S.of(context);
    return Scaffold(
        appBar: getAppBar(_s.app_lifeCycle),
        body: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.topLeft,
          child: ListView(
            children: [
              Row(
                children: [
                  printTxt("应用当前状态："),
                  printTxt(_state, color: Colors.deepPurple)
                ],
              ),
              printTxt(appLifeCycleDes),
              printCode(appLifeCycleCode),
            ],
          ),
        ));
  }
}

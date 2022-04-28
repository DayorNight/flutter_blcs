import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/utils/code.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/widgets/article_model.dart';

class AppLifecyclePage extends StatefulWidget {
  static final String keys = "applifeView";

  const AppLifecyclePage({Key? key}) : super(key: key);

  @override
  _AppLifecycleState createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecyclePage>
    with WidgetsBindingObserver {
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
    return ArticleModel(
      title: S.of(context).appLifeCycle,
      keys: AppLifecyclePage.keys,
      logoColor: Theme.of(context).primaryColor,
      des: appLifeCycleDes,
      code: appLifeCycleCode,
      headerChild: Row(
        children: [
          printTxt("应用当前状态："),
          printTxt(_state, color: Colors.deepPurple)
        ],
      ),
    );
    // return Scaffold(
    //     appBar: getAppBar(_s.app_lifeCycle),
    //     body: Container(
    //       padding: EdgeInsets.all(10),
    //       alignment: Alignment.topLeft,
    //       child: ListView(
    //         children: [
    //           Row(
    //             children: [
    //               printTxt("应用当前状态："),
    //               printTxt(_state, color: Colors.deepPurple)
    //             ],
    //           ),
    //           printTxt(appLifeCycleDes),
    //           printCode(appLifeCycleCode),
    //         ],
    //       ),
    //     ));
  }
}

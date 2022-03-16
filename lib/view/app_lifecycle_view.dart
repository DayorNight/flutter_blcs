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
    ///监听生命周期
    WidgetsBinding.instance?.addObserver(this);
  }
  @override
  void dispose() {
    ///移除监听
    WidgetsBinding.instance?.removeObserver(this);
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
      body: Container(child: Text("步骤：\n"
          "1. 监听应用生命周期\n"
          "   initState()方法中调用  WidgetsBinding.instance?.addObserver(this)\n"
          "2. 继承  WidgetsBindingObserver 重写 didChangeAppLifecycleState(AppLifecycleState state)\n"
          "   AppLifecycleState 中的状态包括：resumed、inactive、paused、detached 四种\n"
          "   (1) resumed:应用程序是可见的。当应用从后台切换到前台时返回该状态 \n"
          "   (2) inactive:应用程序处于非活动状态，不接收用户输入 \n"
          "   (3) pause:应用程序目前对用户不可见，当应用从前台切换到后台并且在后台运行时返回该状态\n"
          "   (4) detached:应用程序仍然被托管在flutter引擎上，但与任何主机视图分离 \n"
          "3. 解除监听\n"
          "   dispose()方法中调用  WidgetsBinding.instance?.removeObserver(this);"
      )),
    );
  }
}

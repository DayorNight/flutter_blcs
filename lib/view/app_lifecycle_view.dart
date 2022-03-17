import 'package:flutter/material.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/utils/weiget_util.dart';
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
  final String _code = """class _AppLifecycleState extends State<AppLifecycleView> 
  with WidgetsBindingObserver {
  @override
  void initState() {///监听生命周期
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }
  @override
  void dispose() {///移除监听
    WidgetsBinding.instance?.removeObserver(this);
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
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
}""";

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
              printTxt("一、使用步骤："),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    printTxt("1. 监听应用生命周期"),
                    printTxt("    initState()方法中调用"),
                    printTxt("     WidgetsBinding.instance?.addObserver(this)"),
                    printTxt(
                        "2. 继承  WidgetsBindingObserver 重写 didChangeAppLifecycleState(AppLifecycleState state)"),
                    printTxt("    AppLifecycleState 中的状态包括："),
                    printTxt("    resumed、inactive、paused、detached 四种"),
                    printTxt("    (1) resumed:应用程序是可见的"),
                    printTxt("    当应用从后台切换到前台时返回该状态"),
                    printTxt("    (2) inactive:应用程序处于非活动状态"),
                    printTxt("    不接收用户输入"),
                    printTxt("    (3) pause:应用程序目前对用户不可见"),
                    printTxt("    当应用从前台切换到后台并且在后台运行时返回该状态"),
                    printTxt("    (4) detached:应用程序仍然被托管在flutter引擎上"),
                    printTxt("    但与任何主机视图分离"),
                    printTxt("3. 解除监听"),
                    printTxt("    dispose()方法中调用"),
                    printTxt(
                        "    WidgetsBinding.instance?.removeObserver(this);"),
                  ],
                ),
              ),
              printTxt("二、代码如下："),
              printCode(_code),
            ],
          ),
        ));
  }
}

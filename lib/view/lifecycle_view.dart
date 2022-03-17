import 'package:flutter/material.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/utils/weiget_util.dart';
class LifeCycleView extends StatefulWidget {
  const LifeCycleView({Key? key}) : super(key: key);
  @override
  _LifeCycleViewState createState() {
    /*当 StatefulWidget 被创建时会立即执行 createState*/
    print("createState 当 StatefulWidget 被创建时调用");
    return _LifeCycleViewState();
  }
}

class _LifeCycleViewState extends State<LifeCycleView> {
  final String _code =
      """class _LifeCycleViewState extends State<LifeCycleView> {
  @override
  void initState() {
    super.initState();
    /*初始化initState 只会被调用一次*/
    print("initState 初始化initState时调用");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    /*依赖全局State 发生变化时会被调用*/
    print("didChangeDependencies 全局 State 发生变化时会被调用");
  }
  
  @override
  Widget build(BuildContext context) {
    print("build 渲染 widget 时调用");
    return Text("data");
  }
  
  @override
  void reassemble() {
    super.reassemble();
    /*主要在开发阶段使用，在 debug 模式下，每次热重载都会调用该函数*/
    print("reassemble 每次热重载都会调用");
  }

  @override
  void didUpdateWidget(LifeCycleView oldWidget) {
    super.didUpdateWidget(oldWidget);
    /*该函数主要是在组件重新构建，比如说热重载，父组件发生 build 的情况下，子组件该方法才会被调用*/
    print("didUpdateWidget 组件重新构建时调用");
  }

  @override
  void deactivate() {
    super.deactivate();
    /*在组件被移除节点后会被调用*/
    print("deactivate 组件被移除节点后会被调用");
  }
  
  @override
  void dispose() {
    super.dispose();
    /*永久移除组件，并释放组件资源*/
    print("dispose 永久移除组件，并释放组件资源时调用");
  }
}""";

  @override
  void initState() {
    super.initState();
    /*初始化initState只会被调用一次*/
    print("initState 初始化initState时调用");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    /*依赖全局State 发生变化时会被调用*/
    print("didChangeDependencies 全局 State 发生变化时会被调用");
  }



  @override
  Widget build(BuildContext context) {
    print("build 渲染 widget 时调用");
    return Scaffold(
      appBar: getAppBar(S.of(context).lifeCycle),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          printTxt("Widget生命周期启动：createState -> initState -> didChangeDependencies -> build"),
          printTxt("Widget生命周期退出：deactivate -> dispose"),
          printTxt("Widget生命周期热重载：reassemble -> didUpdateWidget -> build"),
          printTxt("一、生命周期"),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                printTxt(" StatelessWidget"),
                printTxt("  无状态组件是不可变的，这意味着它们的属性不能变化，所有的值都是最终的"),
                printTxt("  对于无状态组件生命周期只有 build 这个过程"),
                printTxt("  无状态组件的构建方法通常只在三种情况下会被调用"),
                printTxt("   1.小组件第一次被插入树中"),
                printTxt("   2.小组件的父组件改变其配置"),
                printTxt("   3.以及它所依赖的 InheritedWidget 发生变化时"),
                printTxt(" StatefulWidget"),
                printTxt("  1.createState:"),
                printTxt("    当 StatefulWidget 被创建时会立即执行 createState"),
                printTxt("  2.initState"),
                printTxt("    初始化initState只会被调用一次"),
                printTxt("  3.didChangeDependencies"),
                printTxt("    依赖全局State 发生变化时会被调用"),
                printTxt("  4.build"),
                printTxt("    渲染 widget 时调用"),
                printTxt("  5.reassemble"),
                printTxt("    主要在开发阶段使用，在 debug 模式下，每次热重载都会调用该函数"),
                printTxt("  6.didUpdateWidget"),
                printTxt("    该函数主要是在组件重新构建，比如说热重载，父组件发生 build 的情况下，子组件该方法才会被调用"),
                printTxt("  7.deactivate"),
                printTxt("    在组件被移除节点后会被调用"),
                printTxt("  8.dispose"),
                printTxt("    永久移除组件，并释放组件资源"),
              ],
            ),
          ),
          printTxt("二、代码如下"),
          printCode(_code),
        ],
      ),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    /*主要在开发阶段使用，在 debug 模式下，每次热重载都会调用该函数*/
    print("reassemble 每次热重载都会调用");
  }

  @override
  void didUpdateWidget(LifeCycleView oldWidget) {
    super.didUpdateWidget(oldWidget);
    /*该函数主要是在组件重新构建，比如说热重载，父组件发生 build 的情况下，子组件该方法才会被调用*/
    print("didUpdateWidget 组件重新构建时调用");
  }

  @override
  void deactivate() {
    super.deactivate();
    /*在组件被移除节点后会被调用*/
    print("deactivate 组件被移除节点后会被调用");
  }

  @override
  void dispose() {
    super.dispose();
    /*永久移除组件，并释放组件资源*/
    print("dispose 永久移除组件，并释放组件资源时调用");
  }
}

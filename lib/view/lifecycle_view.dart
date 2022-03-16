import 'package:flutter/material.dart';
import 'package:flutter_blcs/utils/weiget_util.dart';

class LifeCycleView extends StatefulWidget {
  const LifeCycleView({Key? key}) : super(key: key);

  @override
  _LifeCycleViewState createState(){
    /*当 StatefulWidget 被创建时会立即执行 createState*/
    print("createState 当 StatefulWidget 被创建时调用");
    return _LifeCycleViewState();
  }
}

class _LifeCycleViewState extends State<LifeCycleView> {

  @override
  void initState() {
    super.initState();
    /*初始化initState 只会被调用一次*/
    print("initState 初始化initState时调用");
  }

  @override
  void didChangeDependencies() {
    /*依赖全局State 发生变化时会被调用*/
    print("didChangeDependencies 全局 State 发生变化时会被调用");
  }
  int _pos = 0;
  var _value = "默认";

  @override
  Widget build(BuildContext context) {
    print("build 渲染 widget 时调用");
    return Scaffold(
      appBar: getAppBar("Demo"),
      body: Column(
        children: [
          TextButton(
            onPressed: (){
              setState(() {
                _value = "xxx";
                _pos++;
              });
            },
            child: Text("click"),
          ),
          Text("_value:$_value"),
          Text("click: $_pos")
        ],
      ),
    );
  }

  @override
  void reassemble() {
    /*主要在开发阶段使用，在 debug 模式下，每次热重载都会调用该函数*/
    print("reassemble 每次热重载都会调用");
  }

  @override
  void didUpdateWidget(LifeCycleView oldWidget) {
    /*该函数主要是在组件重新构建，比如说热重载，父组件发生 build 的情况下，子组件该方法才会被调用*/
    print("didUpdateWidget 组件重新构建时调用");
  }

  @override
  void deactivate() {
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

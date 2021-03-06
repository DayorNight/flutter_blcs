import 'package:flutter/material.dart';
import 'package:flutter_blcs/generated/l10n.dart';
import 'package:flutter_blcs/common/utils/code.dart';
import 'package:flutter_blcs/widgets/article_model.dart';

class LifeCyclePage extends StatefulWidget {
  static final String keys = "lifeCycleView";

  const LifeCyclePage({Key? key}) : super(key: key);

  @override
  _LifeCyclePageState createState() {
    /*当 StatefulWidget 被创建时会立即执行 createState*/
    print("createState 当 StatefulWidget 被创建时调用");
    return _LifeCyclePageState();
  }
}

class _LifeCyclePageState extends State<LifeCyclePage> {
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
    return ArticleModel(title: S
        .of(context)
        .lifeCycle,
        keys: LifeCyclePage.keys,
        logoColor: Theme
            .of(context)
            .primaryColor,
        des: lifeCycleDes,
        code: lifeCycleCode);
  }

  @override
  void reassemble() {
    super.reassemble();
    /*主要在开发阶段使用，在 debug 模式下，每次热重载都会调用该函数*/
    print("reassemble 每次热重载都会调用");
  }

  @override
  void didUpdateWidget(LifeCyclePage oldWidget) {
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

///全局状态管理
final String providerCode ='''//1.创建provider
class CounterProvider extends ChangeNotifier {
  int _counter = 100;
  intget counter {
    return _counter;
  }
  set counter(int value) {
    _counter = value;
    notifyListeners();
  }
}
//2. 初始化provider
runApp(ChangeNotifierProvider(
  create: (context) => CounterProvider(),
  child: MyApp(),
));
//当有多个provider 时 使用MultiProvider
runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (ctx) => CounterProvider()),
    ChangeNotifierProvider(create: (ctx) => UserProvider()),
  ],
  child: MyApp(),
));
//3.使用Consumer处理数据（状态）
//- Consumer的builder方法解析：
//- 1. 参数一：context，每个build方法都会有上下文，目的是知道当前树的位置
//- 1. 参数二：ChangeNotifier对应的实例，也是我们在builder函数中主要使用的对象
//- 1. 参数三：child，目的是进行优化，如果builder下面有一颗庞大的子树，当模型发生改变的时候，我们并不希望重新build这颗子树，那么就可以将这颗子树放到Consumer的child中，在这里直接引入即可（注意我案例中的Icon所放的位置）
body: Center(
  child: Consumer<CounterProvider>(
    builder: (ctx, counterPro, child) {
      return Text("当前计数:\${counterPro.counter}");
    }
  ),
)
//4. Provider.of获取数据
Text("当前计数:\${Provider.of<CounterProvider>(context).counter}")
//- 优势：代码简洁
//- 弊端：会执行build 方法 ，而Consumer只是局部刷新
//5. Selector
//- Consumer 会执行 builder 方法 ，特殊场景下 希望不刷新builder时 使用Selector
floatingActionButton: Consumer<CounterProvider>(
  builder: (ctx, counterPro, child) {
    return FloatingActionButton(
      child: child,
      onPressed: () {
        counterPro.counter += 1;
      },
    );
  },
  child: Icon(Icons.add),
),
//转换如下
floatingActionButton: Selector<CounterProvider, CounterProvider>(
  selector: (ctx, provider) => provider,
  shouldRebuild: (pre, next) => false,
  builder: (ctx, counterPro, child) {
    print("floatingActionButton展示的位置builder被调用");
    return FloatingActionButton(
      child: child,
      onPressed: () {
        counterPro.counter += 1;
      },
    );
  },
  child: Icon(Icons.add),
),
''';
final String providerDes ='''一、屏幕适配
  1.引入依赖
    dependencies: provider:^6.0.2
  2.导包
    import 'package:provider/provider.dart';
  3.基本使用
    (1)创建provider 继承 ChangeNotifier 存放需要数据（状态）.
    - 可以使用继承自ChangeNotifier，也可以使用混入，这取决于概率是否需要继承自其它的类
    - 我们使用一个私有的_counter，并且提供了getter和setter
    - 在setter中我们监听到_counter的改变，就调用notifyListeners方法，通知所有的Consumer进行更新
    (2)初始化provider
    - 将ChangeNotifierProvider放到了顶层，这样方便在整个应用的任何地方可以使用CounterProvider
    (3)使用Consumer/Selector/Provider.of 操作数据（状态）
二、代码如下
''';

///屏幕适配
final String screenAdapterCode = """
@override
Widget build(BuildContext context) {
  //设置尺寸（填写设计中设备的屏幕尺寸）如果设计基于360dp * 690dp的屏幕
  ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize:  Size(750, 1334),
      context: context,
      minTextAdapt: true,
      orientation: Orientation.portrait);
  return Scaffold(
    appBar: getAppBar(S.of(context).screen_adapter),
    body: ListView(
      padding: EdgeInsets.all(10),
      children: [
        printTxt(screenAdapterDes),
        printCode(screenAdapterCode),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            printTxt("屏幕宽度大小：\${MediaQuery.of(context).size.width}"),
            printTxt("屏幕高度大小：\${MediaQuery.of(context).size.height}"),
            printTxt("Flutter大小100的正方形："),
            Container(width: 100,height: 100, color: Colors.black,),
            printTxt("大小100.w的正方形："),
            Container(width: 100.w,height: 100.w, color: Colors.blue,),
            printTxt("大小50.r的正方形："),
            Container(width: 100.r,height: 100.r, color: Colors.indigo,),
            printTxt("大小0.5.sw的正方形："),
            Container(width: 0.5.sw,height: 0.5.sw, color: Colors.deepPurpleAccent,),
            Text("Flutter字体大小30",style: TextStyle(fontSize: 30)),
            Text("适配字体大小30.sp",style: TextStyle(fontSize: 30.sp)),
          ],
        )
      ],
    ),
  );
}""";
final String screenAdapterDes = """一、屏幕适配
  1.添加依赖
    flutter_screenutil: ^5.3.1
  2.导包
    import 'package:flutter_screenutil/flutter_screenutil.dart';
  3.初始化并设置适配尺寸
    两种初始化方式：
    （1）第一种支持在MaterialApp的theme的textTheme中使用字体适配
    （2）第二种不支持（非必要，推荐使用第二种方式
    初始化代码：ScreenUtil.init()
  4.使用
      width: 50.w,  //根据屏幕宽度适配尺寸
      width: 50.h,  //根据屏幕高度适配尺寸
      width: 50.r,  //根据宽度或高度中的较小者进行调整
      width: 0.2.sw,  //屏幕宽度的0.2倍
      width: 0.5.sh,  //屏幕高度的50%
      fontSize: 16.sp,  //适配字体
二、代码如下
""";

///生命周期
final String lifeCycleCode = """class _LifeCycleViewState extends State<LifeCycleView> {
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
final String lifeCycleDes = """Widget生命周期启动：createState -> initState -> didChangeDependencies -> build
Widget生命周期退出：deactivate -> dispose
Widget生命周期热重载：reassemble -> didUpdateWidget -> build
一、生命周期
(1)StatelessWidget
 无状态组件是不可变的，这意味着它们的属性不能变化，所有的值都是最终的
 对于无状态组件生命周期只有 build 这个过程
 无状态组件的构建方法通常只在三种情况下会被调用
  1.小组件第一次被插入树中
  2.小组件的父组件改变其配置
  3.以及它所依赖的 InheritedWidget 发生变化时
(2)StatefulWidget
 1.createState:
   当 StatefulWidget 被创建时会立即执行 createState
 2.initState:
   初始化initState只会被调用一次
 3.didChangeDependencies
   依赖全局State 发生变化时会被调用.
 4.build
   渲染 widget 时调用
 5.reassemble
   主要在开发阶段使用，在 debug 模式下，每次热重载都会调用该函数
 6.didUpdateWidget
   该函数主要是在组件重新构建，比如说热重载，父组件发生 build 的情况下，子组件该方法才会被调用
 7.deactivate
   在组件被移除节点后会被调用
 8.dispose
   永久移除组件，并释放组件资源
二、代码如下
""";

///APP应用生命周期
final String appLifeCycleCode = """class _AppLifecycleState extends State<AppLifecycleView> 
  with WidgetsBindingObserver {
  @override
  void initState() {///监听生命周期
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }
  @override
  void dispose() {///移除监听
    super.dispose();
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
final String appLifeCycleDes = """一、使用步骤
1. 监听应用生命周期
initState()方法中调用 WidgetsBinding.instance?.addObserver(this)
2. 继承  WidgetsBindingObserver 重写 didChangeAppLifecycleState(AppLifecycleState state)
AppLifecycleState 中的状态包括：
resumed、inactive、paused、detached 四种
(1) resumed:应用程序是可见的,当应用从后台切换到前台时返回该状态
(2) inactive:应用程序处于非活动状态,不接收用户输入
(3) pause:应用程序目前对用户不可见,当应用从前台切换到后台并且在后台运行时返回该状态
(4) detached:应用程序仍然被托管在flutter引擎上,但与任何主机视图分离
3. 解除监听
dispose()方法中调用WidgetsBinding.instance?.removeObserver(this);
二、代码如下
""";

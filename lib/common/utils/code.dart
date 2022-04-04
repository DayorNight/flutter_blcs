///交织动画
const String mixedAnimationDes = '''一、交织动画
  1.简介
    一些复杂的动画，可能由一个动画序列或重叠的动画组成。要实现这种效果，使用交织动画（Stagger Animation）会非常简单
  2.交织动画需要注意以下几点：
    1. 要创建交织动画，需要使用多个动画对象（Animation）。
    2. 一个AnimationController控制所有的动画对象。
    3. 给每一个动画对象指定时间间隔（Interval）
二、代码如下
''';
const String  mixedAnimationCode = '''
class _DemoViewState extends State<DemoView> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  late Animation<Size?> sizeAnimation;
  late Animation<Color?> colorAnimation;
  late Animation<double> fadeAnimation;
  late Animation<double> rotateAnimation;
  late Animation<Offset> moveAnimation;

  @override
  void initState() {
    super.initState();
    //1.创建动画控制器
    _controller = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);
    //2.创建动画执行过程
    animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    //3.定义动画范围
    //大小
    sizeAnimation =
        SizeTween(begin: Size.square(100.r), end: Size.square(700.r))
            .animate(animation);
    //颜色
    colorAnimation =
        ColorTween(begin: Colors.black, end: Colors.red).animate(animation);
    //透明度
    fadeAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(animation);
    //旋转
    rotateAnimation = Tween(
      begin: 0.0,
      end: 30.0,
    ).animate(animation);
    //移动
    moveAnimation = Tween(
      begin: Offset(0, 0),
      end: Offset(0, 0.5),
    ).animate(animation);
  }

  _startAnimation() async {
    if (_controller.isAnimating) {
      _controller.stop();
    } else {
      if (animation.status == AnimationStatus.reverse) {
        _controller.reverse();
      } else if (animation.status == AnimationStatus.forward) {
        _controller.forward();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context, 'demo'),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => _startAnimation(),
              child: Text("Start Animation"),
            ),
            _staggerWidget,
          ],
        ),
      ),
    );
  }

  /**
   * 交织动画
   */
  Widget get _staggerWidget {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return RotationTransition(
            alignment: Alignment.bottomCenter,
            turns: rotateAnimation,
            child: FadeTransition(
              opacity: fadeAnimation,
              child: SlideTransition(
                position: moveAnimation,
                child: Container(
                  child: Container(
                    child: Icon(
                      Icons.star,
                      size: sizeAnimation.value?.width,
                      color: colorAnimation.value,
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
''';

///路由动画
const String RouteAnimationDes = '''一、路由动画
  1.简介
    Material组件库中提供了一个MaterialPageRoute组件，它可以使用和平台风格一致的路由切换动画，如在iOS上会左右滑动切换，而在Android上会上下滑动切换
  2.CupertinoPageRoute
    使用CupertinoPageRoute 也可以使android 实现左右切换风格
    Navigator.push(context, CupertinoPageRoute(builder: (context) => pageB());
  3.PageRouteBuilder
    使用PageRouteBuilder来自定义路由切换动画
  4.PageRoute
    无论是MaterialPageRoute、CupertinoPageRoute，还是PageRouteBuilder，它们都继承自PageRoute类，而PageRouteBuilder其实只是PageRoute的一个包装，我们可以直接继承PageRoute类来实现自定义路由
二、代码如下
''';
const String  RouteAnimationCode = '''
class _DemoViewState extends State<DemoView>{
  String value = "默认路由方式";
  String value1 = "左右切换方式";
  String value2 = "PageRouteBuilder自定义方式";
  String value3 = "继承PageRoute自定义方式";
  String pages = '页面B';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('demo'),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //默认路由方式
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => pageB(),
                    ));
              },
              child: Text(value)),
          //左右切换方式
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => pageB(),
                    ));
              },
              child: Text(value1)),
          //PageRouteBuilder自定义方式
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder:
                            (context, animation, secondaryAnimation) {
                          return FadeTransition(
                            opacity: animation,
                            child: pageB(),
                          );
                        },
                        transitionDuration: Duration(milliseconds: 500)));
              },
              child: Text(value2)),
          //继承PageRoute自定义方式
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    FadeRoute(builder: (context) => pageB()));
              },
              child: Text(value3)),
        ],
      ),
    );
  }
  /**
   * B页面
   */
  Scaffold pageB() {
    return Scaffold(
      appBar: getAppBar('demo'),
      body: Center(
        child: Text(pages),
      ),
    );
  }
}
//FadeRoute
class FadeRoute extends PageRoute {

  FadeRoute({
    required this.builder,
    this.transitionDuration = const Duration(milliseconds: 500),
    this.opaque = true,
    this.barrierDismissible = false,
    this.barrierColor,
    this.barrierLabel,
    this.maintainState = true,
  });

  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final bool opaque;

  @override
  final bool barrierDismissible;

  @override
  final Color? barrierColor;

  @override
  final String? barrierLabel;

  @override
  final bool maintainState;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) => builder(context);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: builder(context),
    );
  }

}
''';

///简单动画
const String AnimationDes = '''一、Animation动画
  1.简介
    Flutter中也对动画进行了抽象，主要涉及 Animation、Curve、Controller、Tween这四个角色，它们一起配合来完成一个完整动画
  2.Animation
    1.可以通过Animation来监听动画每一帧以及执行状态的变化
    2.addListener():可以用于给Animation添加帧监听器，在每一帧都会被调用。帧监听器中最常见的行为是改变状态后调用setState()来触发UI重建
    3.addStatusListener():可以给Animation添加“动画状态改变”监听器；动画开始、结束、正向或反向（见AnimationStatus定义）时会调用状态改变的监听器
    4.Flutter中，有四种动画状态，在AnimationStatus枚举类中定义
      - dismissed:动画在起始点停止
      - forward:动画正在正向执行
      - reverse:动画正在反向执行
      - completed:动画在终点停止
  3.Curve
    1.通过Curve（曲线）来描述动画过程，我们把匀速动画称为线性的(Curves.linear)，而非匀速动画称为非线性的
    2.可以通过CurvedAnimation来指定动画过程是匀速的、匀加速的或者先加速后减速等
    3.final CurvedAnimation curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  4.AnimationController
    1.用于控制动画，它包含动画的启动forward()、停止stop() 、反向播放 reverse()等方法
    2.AnimationController会在动画的每一帧，就会生成一个新的值。默认情况下，AnimationController在给定的时间段内线性的生成从 0.0 到1.0（默认区间）的数字
    3.AnimationController生成数字的区间可以通过lowerBound和upperBound来指定
    4.final AnimationController controller = AnimationController( duration: const Duration(milliseconds: 2000), lowerBound: 10.0,upperBound: 20.0,vsync: this);
  5.Tween
    1.定义从输入范围到输出范围的映射。输入范围通常为[0.0，1.0]，但这不是必须的，我们可以自定义需要的范围
    2.Animation<int> alpha = IntTween(begin: 0, end: 255).animate(controller)
二、简单使用
  1.创建动画控制器
    AnimationController  controller = AnimationController(duration: Duration(milliseconds: 800), vsync: this);
  2.创建动画执行过程
    Animation<double> animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  3.定义动画范围
    Animation<double> animation = Tween(begin: 100.r, end: 250.r).animate(animation)
  4.定义动画Widget
    （1）方式一：继承AnimatedWidget
    （2）方式二：使用AnimatedBuilder
  5.动画操作
    //动画正向执行
    controller.forward()
    //动画反向执行
    controller.reverse()
    //暂停动画
    controller.stop();
  6.释放动画资源
    controller.dispose();
三、代码如下
''';
const String AnimationCode = '''
class _DemoViewState extends State<DemoView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    //1.创建动画控制器
    controller =
        AnimationController(duration: Duration(milliseconds: 800), vsync: this);
    //2.创建动画执行过程
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    //3.定义动画范围
    animation = Tween(begin: 100.r, end: 250.r).animate(animation)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //动画执行结束时反向执行动画
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          //动画恢复到初始状态时执行动画（正向）
          controller.forward();
        }
      });
    //5.启动动画
    controller.forward();
  }

  /**
   * 播放动画
   */
  void _play() {
    if (controller.isAnimating) return;
    if (animation.status == AnimationStatus.reverse) {
      controller.reverse();
    } else if (animation.status == AnimationStatus.forward) {
      controller.forward();
    }
  }

  /**
   * 停止动画
   */
  void _stop() {
    if (controller.isAnimating) {
      controller.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar('Demo'),
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                  iconSize: 80,
                  onPressed: _play,
                  icon: Icon(
                    Icons.play_circle_outline_rounded,
                  )),
              IconButton(
                  iconSize: 80,
                  onPressed: _stop,
                  icon: Icon(Icons.pause_circle_outline_rounded)),
            ],
          ),
          Row(
            children: [
              //4.方式1：继承AnimatedWidget
              AnimatedImage(
                listenable: animation,
              ),
              //4.方式2：使用AnimatedBuilder
              AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    return Center(
                      child: Icon(
                        Icons.favorite_rounded,
                        color: Colors.red,
                        size: animation.value,
                      ),
                    );
                  })
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    //6.释放动画资源
    controller.dispose();
    super.dispose();
  }
}

class AnimatedImage extends AnimatedWidget {
  AnimatedImage({required Listenable listenable})
      : super(listenable: listenable);

  @override
  Widget build(BuildContext context) {
    var animation = listenable as Animation<double>;
    return Icon(
      Icons.favorite_rounded,
      color: Colors.red,
      size: animation.value,
    );
  }
}
''';

///hero动画
const String heroDes = '''一、Hero动画
  1.简介
    Hero 指的是可以在路由(页面)之间“飞行”的 widget，简单来说 Hero 动画就是在路由切换时，有一个共享的widget 可以在新旧路由间切换
    由于共享的 widget 在新旧路由页面上的位置、外观可能有所差异，所以在路由切换时会从旧路逐渐过渡到新路由中的指定位置，这样就会产生一个 Hero 动画
  2.常见场景
    1.点击头像 跳转个人详情时 头像放大转场效果
    2.微信朋友圈 点击图片 查看大图转场效果
    3....
  3.基本使用
    (1)在路由A中创建Hero组件，包裹转场过渡的组件. 例：
    - Hero(tag: 'hero-rectangle',child: Container(width: 50,height: 50,color: Colors.blue))
    (2)在路由B中创建具有相同tag参数的Hero组件
    - Hero(tag: 'hero-rectangle',child: Container(width: 250,height: 250,color: Colors.blue))
    (3)当我们从A跳到B时或B返回A时会产生一个过渡的转场效果，如果位置不在同一个地方，会产生一个飞行的过渡动画。
二、代码如下
''';
const String heroCode = '''class _DemoViewState extends State<DemoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: GestureDetector(
        child: Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: 'hero',
              child: Icon(Icons.circle,size: 50),
            )
        ),
        onTap:() => _gotoDetailsPage(context) ,
      )
    );
  }
  void _gotoDetailsPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => Scaffold(
        body: Align(
            alignment: Alignment.bottomCenter,
            child: Hero(
              tag: 'hero',
              child: Icon(Icons.circle,size: 100)
            )
        ),
      ),
    ));
  }
}
''';
///全局状态管理
const String providerCode ='''//1.创建provider
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
const String providerDes ='''一、全局状态管理
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
const String screenAdapterCode = """
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
const String screenAdapterDes = """一、屏幕适配
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
const String lifeCycleCode = """class _LifeCycleViewState extends State<LifeCycleView> {
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
const String lifeCycleDes = """Widget生命周期启动：createState -> initState -> didChangeDependencies -> build
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
const String appLifeCycleCode = """class _AppLifecycleState extends State<AppLifecycleView> 
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
const String appLifeCycleDes = """一、使用步骤
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

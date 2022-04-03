import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DemoView extends StatefulWidget {
  static final String keys = "demoView";

  const DemoView({Key? key}) : super(key: key);

  @override
  _DemoViewState createState() => _DemoViewState();
}

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

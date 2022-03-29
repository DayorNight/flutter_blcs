import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/weiget_util.dart';
import 'package:flutter_blcs/pages/my/animation_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DemoView extends StatefulWidget {
  static final String keys = "demoView";

  const DemoView({Key? key}) : super(key: key);

  @override
  _DemoViewState createState() => _DemoViewState();
}

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

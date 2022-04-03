import 'package:flutter/material.dart';
import 'package:flutter_blcs/common/utils/print.dart';
import 'package:flutter_blcs/widgets/article_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/utils/code.dart';
import '../../common/weiget_util.dart';
import '../../generated/l10n.dart';
import '../../widgets/animation/stagger_animation.dart';

class MixedAnimationView extends StatefulWidget {
  static final String keys = "mixedAnimationView";

  const MixedAnimationView({Key? key}) : super(key: key);

  @override
  _MixedAnimationViewState createState() => _MixedAnimationViewState();
}

class _MixedAnimationViewState extends State<MixedAnimationView>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  // late Animation<double> animation1;
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
    // 3.定义时间间隔
    // animation1 = CurvedAnimation(parent: _controller, curve: Interval(0.4,1, curve: Curves.linear));
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
      end: Offset(0, 0.8),
    ).animate(animation);
  }

  _startAnimation() async {
    if (_controller.isAnimating) {
      _controller.stop();
    } else {
      if (animation.status == AnimationStatus.completed ||
          animation.status == AnimationStatus.reverse) {
        _controller.reverse();
      } else if (animation.status == AnimationStatus.dismissed ||
          animation.status == AnimationStatus.forward) {
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
    return Stack(
      children: [
        ArticleModel(
          title: S.of(context).mixedAnimation,
          keys: MixedAnimationView.keys,
          logoColor: Theme.of(context).primaryColor,
          des: mixedAnimationDes,
          code: mixedAnimationCode,
        ),
        Container(
          margin: EdgeInsets.only(top: 180.r),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              OutlinedButton(
                onPressed: () => _startAnimation(),
                child: Text("Start Animation"),
              ),
              _staggerWidget,
            ],
          ),
        ),
      ],
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
